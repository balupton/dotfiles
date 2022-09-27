#!/usr/bin/env deno run --allow-net --allow-env

async function wanip () {
	const response = await fetch('https://whatmyip.bevry.workers.dev')
	const result = await response.text()
	return result.replace(/\s/g, '')
}

async function fetch_cloudflare(token: string, path: string, method: 'GET' | 'PUT', body: string): any{
	const opts = {
		method,
		headers: {
			'Authorization': `Bearer ${token}`,
			'Accept': 'application/json',
			'Content-Type': 'application/json',
		}
	}
	if ( body ) opts.body = body
	const response = await fetch('https://api.cloudflare.com/client/v4/' + path, opts)
	const result = await response.json()
	return result
}

function update_record (token: string, zone_id: string, record_id: string, record_type: string, record_target: string) {
	if ( !zone_id ) throw new Error('Invalid zone_id')
	if ( !record_id ) throw new Error('Invalid record_id')
	if ( !record_type ) throw new Error('Invalid record_type')
	if ( !record_target ) throw new Error('Invalid record_target')

	// https://api.cloudflare.com/#dns-records-for-a-zone-update-dns-record
	const body = JSON.stringify({
		'type': record_type,
		'name': 'ddns.bevry.me',
		'content': record_target,
		'ttl': 1,
		'proxied': true
	})
	return fetch_cloudflare(
		token,
		`zones/${zone_id}/dns_records/${record_id}`,
		'PUT',
		body
	)
}

function fetch_zones (token: string) {
	return fetch_cloudflare(token, 'zones', 'GET', '')
}

function fetch_records (token: string, zone_id: string) {
	return fetch_cloudflare(token, `zones/${zone_id}/dns_records`, 'GET', '')
}

// env TOKEN='' cloudflare-dynamic-dns <zone_id> <record_id> <record_type>
async function run () {
	const args = Deno.args.slice()
	const token = Deno.env.get('TOKEN')
	// console.log({args, token})

	// const zones = await fetch_zones(token)
	// console.log('zones:', zones)
	// for ( const zone of zones.result ) {
	// 	const records = await fetch_records(token, zone.id)
	// 	console.log('records:', records)
	// }

	const ip = await wanip()
	console.log({ip})
	while ( args.length ) {
		const zone_id = args.shift()
		const record_id = args.shift()
		const record_type = args.shift()
		const record_target = ip
		const result = await update_record(token, zone_id, record_id, record_type, record_target)
		console.log('result:', result)
	}
}

run()
