Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E081CC96F0
	for <lists+freedreno@lfdr.de>; Thu,  3 Oct 2019 05:23:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C8766E094;
	Thu,  3 Oct 2019 03:23:23 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710077.outbound.protection.outlook.com [40.107.71.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 551416E33A
 for <freedreno@lists.freedesktop.org>; Mon, 30 Sep 2019 05:04:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FmUTye373GcavQKLetK5yaBMFTmuJ6BbEqlE4k3JDTesBCiTzxXUtsju9uNTuCWl2fgclRUwG6fVRtlOoEqAYUjIDnUa5GXgUUSSlZOok8aJLPf+5Oj4GzeiSM0QzIkeL+kbxMlALRYZ70apGOd79bm0HNqhdRJOTiY2AHfP3E2jJs9TJ9KbbaiZZz4cIgFFEU60jCat2VR/DsQilJ5svM5sIZzt0R8FbshKgBkw7nzmodzwmqAsiVosfuQ9C+Dxkb/WvQOI8N9U2NndZIIwrZzigolNXDiVZsWrBQJanOOi2Ezux86+jNIMPuxcpglVGl1IPWUZtNcKs6h/qfG7pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kMKlD4GmDmxnIi0U0FkoFbbGyegLScZFxpUc1Y0ryf8=;
 b=RLU/gqFuAhIRwaT3B5FcYzCrytPxOWELUPJDCVbkQtsbdvjpd5vBXLTCDsMkMCMo9587edbe3b62FWqfpEBw6i3zioHe0y/l5AdmvDnxyRAILkCkKBAIHU+0RSdUCKVjV6XuRLYr/6D9Ndn443Fi+kw2OH2tvpRS0btMF7SQR1Mn++8nKaiuks3XNeAt972e3V0CTqljB9c5qZ7v+c7Zz5P5NChxtfx5wyCJLNmMTmWHmx/53uvuDVUSl3/wUOVX/vmLi3NDENLWemRFCX2ccigDHJWZCcZb41jHWlEBbQFoSNIa6G/d8yyubdEOakVdSeiNcXkyOZMPid2s84MtWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB3672.namprd12.prod.outlook.com (52.132.246.139) by
 CH2PR12MB3784.namprd12.prod.outlook.com (52.132.231.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.17; Mon, 30 Sep 2019 05:04:53 +0000
Received: from CH2PR12MB3672.namprd12.prod.outlook.com
 ([fe80::9d2e:e96c:28e1:b600]) by CH2PR12MB3672.namprd12.prod.outlook.com
 ([fe80::9d2e:e96c:28e1:b600%6]) with mapi id 15.20.2284.028; Mon, 30 Sep 2019
 05:04:53 +0000
From: "Zhang, Jack (Jian)" <Jack.Zhang1@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, "Kuehling, Felix"
 <Felix.Kuehling@amd.com>, "Zhao, Yong" <Yong.Zhao@amd.com>, "Deng, Emily"
 <Emily.Deng@amd.com>, "Min, Frank" <Frank.Min@amd.com>, "Liu, Shaoyun"
 <Shaoyun.Liu@amd.com>, "Ma, Le" <Le.Ma@amd.com>, "Min, Frank"
 <Frank.Min@amd.com>
Thread-Topic: [PATCH] drm/amd/amdgpu/sriov ip block setting of Arcturus
Thread-Index: AQHVd0v3n4MNi1QawEqeXYD9bGjTCqdDqdBg
Date: Mon, 30 Sep 2019 05:04:53 +0000
Message-ID: <CH2PR12MB3672980A076473DD5C6E5E82BB820@CH2PR12MB3672.namprd12.prod.outlook.com>
References: <20190930050010.7437-1-Jack.Zhang1@amd.com>
In-Reply-To: <20190930050010.7437-1-Jack.Zhang1@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 15434004-b339-4e58-bdfe-08d74563bb09
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: CH2PR12MB3784:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR12MB3784A27E4B394D6A791AC498BB820@CH2PR12MB3784.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 01762B0D64
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(376002)(366004)(346002)(39860400002)(13464003)(189003)(199004)(4326008)(66946007)(26005)(446003)(76176011)(66476007)(11346002)(8676002)(486006)(6506007)(7736002)(186003)(53546011)(2906002)(305945005)(476003)(71200400001)(99286004)(6116002)(3846002)(102836004)(6246003)(81156014)(8936002)(81166006)(64756008)(256004)(14444005)(76116006)(7696005)(66556008)(66446008)(86362001)(33656002)(66066001)(71190400001)(74316002)(229853002)(9686003)(55016002)(6306002)(6436002)(25786009)(478600001)(6636002)(110136005)(966005)(52536014)(316002)(14454004)(5660300002)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR12MB3784;
 H:CH2PR12MB3672.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cN595XbCLa/nixZXfCS1X3lwyDdeleVLnOQHz73HbmKpzI0QxdryxDWQ18RzhUjx71KpUsTTFIMwup30XZb6jHnYgLJ+WMmh3STraxoTgQQ4B27Bp4g0bFmyyKo5Mr/3qCiINn9CBkCBDv9IUmgsmGqJvC65P3FXykD8cBhdzW3/Z9jGTqbay6hsQWaNEWc539sj2+43gyCIEngA8Q9uRdCuJGSc3KMEd/7lbmZmUVUat8uMy1uj8GU5F9rgXVx1yW0BKeBQeUQM5AqE5ThvsXXS1/XOXofoiUl4WLwrai1YHWQrZPrdk7mxNUMAEfZT1Dfi5L05EbqJnm6ne8ZdVZjPUooKPgSmUxTK6NmtWmsZ99MScI9oqXgEUHnNoRNhX0X2JdQZ/EQFNrDroKitLlcRUs1YgWgD1RQttuYxs/kK7RUQKFcJf7B8c+w29+zf6u12qKJVasXEqvbmHGxvqg==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15434004-b339-4e58-bdfe-08d74563bb09
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2019 05:04:53.6991 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2gVFtiU8P4XGV2aly7fSWtoIX+4tQ1FusMLEchUdcJcJDuCwGgpoW01rCN735EnJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3784
X-Mailman-Approved-At: Thu, 03 Oct 2019 03:23:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kMKlD4GmDmxnIi0U0FkoFbbGyegLScZFxpUc1Y0ryf8=;
 b=wQdAufHf+DhKcPEolhpkQaYApnKIJYzkhudszEpCvpQnT3pgXs/+DUt7DXwUemduErzbFpBvyMQsLH9K143H5NryQwsoF0FzLtjBJpn9EddbggpjdGhywUO40mTvo5TFwknni2rD66/xZw4HzyxpOctTDj4CUf0ZRNyOfLcGbFI=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Jack.Zhang1@amd.com; 
Subject: Re: [Freedreno] [PATCH] drm/amd/amdgpu/sriov ip block setting of
 Arcturus
X-BeenThere: freedreno@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Freedreno graphics driver community testing & development
 <freedreno.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno@lists.freedesktop.org>
List-Help: <mailto:freedreno-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=subscribe>
Cc: "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

SGksIGZvbGtzLA0KDQpXb3VsZCB5b3UgcGxlYXNlIGhlbHAgdG8gcmV2aWV3IHRoZSBwYXRjaD8N
Cg0KVGhhbmtzLA0KSmFjaw0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogYW1k
LWdmeCA8YW1kLWdmeC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9m
IEphY2sgWmhhbmcNClNlbnQ6IE1vbmRheSwgU2VwdGVtYmVyIDMwLCAyMDE5IDE6MDAgUE0NClRv
OiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KQ2M6IFpoYW5nLCBKYWNrIChKaWFuKSA8
SmFjay5aaGFuZzFAYW1kLmNvbT4NClN1YmplY3Q6IFtQQVRDSF0gZHJtL2FtZC9hbWRncHUvc3Jp
b3YgaXAgYmxvY2sgc2V0dGluZyBvZiBBcmN0dXJ1cw0KDQpBZGQgaXAgYmxvY2sgc2V0dGluZyBm
b3IgQXJjdHVydXMgU1JJT1YNCg0KMS5QU1AgbmVlZCB0byBiZSBpbml0aWFsaXplZCBiZWZvcmUg
SUguDQoyLlNNVSBkb2Vzbid0IG5lZWQgdG8gYmUgaW5pdGlhbGl6ZWQgYXQga21kIGRyaXZlci4N
CjMuQXJjdHVydXMgZG9lc24ndCBzdXBwb3J0IERDRSBoYXJkd2FyZSxpdCBuZWVkcyB0byBza2lw
DQogIHJlZ2lzdGVyIGFjY2VzcyB0byBEQ0UuDQoNClNpZ25lZC1vZmYtYnk6IEphY2sgWmhhbmcg
PEphY2suWmhhbmcxQGFtZC5jb20+DQotLS0NCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9n
bWNfdjlfMC5jIHwgMTAgKysrKysrLS0tLQ0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Nv
YzE1LmMgICAgfCAxOSArKysrKysrKysrKysrKystLS0tDQogMiBmaWxlcyBjaGFuZ2VkLCAyMSBp
bnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dt
Y192OV8wLmMNCmluZGV4IDk1YTlhNWY1Li40NDAyM2JkIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYw0KKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvZ21jX3Y5XzAuYw0KQEAgLTEzMzAsMTEgKzEzMzAsMTMgQEAgc3RhdGljIGludCBnbWNf
djlfMF9od19pbml0KHZvaWQgKmhhbmRsZSkNCiAJZ21jX3Y5XzBfaW5pdF9nb2xkZW5fcmVnaXN0
ZXJzKGFkZXYpOw0KIA0KIAlpZiAoYWRldi0+bW9kZV9pbmZvLm51bV9jcnRjKSB7DQotCQkvKiBM
b2Nrb3V0IGFjY2VzcyB0aHJvdWdoIFZHQSBhcGVydHVyZSovDQotCQlXUkVHMzJfRklFTEQxNShE
Q0UsIDAsIFZHQV9IRFBfQ09OVFJPTCwgVkdBX01FTU9SWV9ESVNBQkxFLCAxKTsNCisJCWlmIChh
ZGV2LT5hc2ljX3R5cGUgIT0gQ0hJUF9BUkNUVVJVUykgew0KKwkJCS8qIExvY2tvdXQgYWNjZXNz
IHRocm91Z2ggVkdBIGFwZXJ0dXJlKi8NCisJCQlXUkVHMzJfRklFTEQxNShEQ0UsIDAsIFZHQV9I
RFBfQ09OVFJPTCwgVkdBX01FTU9SWV9ESVNBQkxFLCAxKTsNCiANCi0JCS8qIGRpc2FibGUgVkdB
IHJlbmRlciAqLw0KLQkJV1JFRzMyX0ZJRUxEMTUoRENFLCAwLCBWR0FfUkVOREVSX0NPTlRST0ws
IFZHQV9WU1RBVFVTX0NOVEwsIDApOw0KKwkJCS8qIGRpc2FibGUgVkdBIHJlbmRlciAqLw0KKwkJ
CVdSRUczMl9GSUVMRDE1KERDRSwgMCwgVkdBX1JFTkRFUl9DT05UUk9MLCBWR0FfVlNUQVRVU19D
TlRMLCAwKTsNCisJCX0NCiAJfQ0KIA0KIAlyID0gZ21jX3Y5XzBfZ2FydF9lbmFibGUoYWRldik7
DQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMNCmluZGV4IGRiZDc5MGUuLmFjMTgxZTMgMTAw
NjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jDQorKysgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jDQpAQCAtNzU0LDE0ICs3NTQsMjUgQEAgaW50
IHNvYzE1X3NldF9pcF9ibG9ja3Moc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpDQogCWNhc2Ug
Q0hJUF9BUkNUVVJVUzoNCiAJCWFtZGdwdV9kZXZpY2VfaXBfYmxvY2tfYWRkKGFkZXYsICZ2ZWdh
MTBfY29tbW9uX2lwX2Jsb2NrKTsNCiAJCWFtZGdwdV9kZXZpY2VfaXBfYmxvY2tfYWRkKGFkZXYs
ICZnbWNfdjlfMF9pcF9ibG9jayk7DQotCQlhbWRncHVfZGV2aWNlX2lwX2Jsb2NrX2FkZChhZGV2
LCAmdmVnYTEwX2loX2lwX2Jsb2NrKTsNCi0JCWlmIChsaWtlbHkoYWRldi0+ZmlybXdhcmUubG9h
ZF90eXBlID09IEFNREdQVV9GV19MT0FEX1BTUCkpDQotCQkJYW1kZ3B1X2RldmljZV9pcF9ibG9j
a19hZGQoYWRldiwgJnBzcF92MTFfMF9pcF9ibG9jayk7DQorDQorCQkvKiBGb3IgTUkxMDAgU1It
SU9WLCBQU1AgbmVlZCB0byBiZSBpbml0aWFsaXplZCBiZWZvcmUgSUggKi8NCisJCWlmIChhbWRn
cHVfc3Jpb3ZfdmYoYWRldikpIHsNCisJCQlpZiAobGlrZWx5KGFkZXYtPmZpcm13YXJlLmxvYWRf
dHlwZSA9PSBBTURHUFVfRldfTE9BRF9QU1ApKQ0KKwkJCQlhbWRncHVfZGV2aWNlX2lwX2Jsb2Nr
X2FkZChhZGV2LCAmcHNwX3YxMV8wX2lwX2Jsb2NrKTsNCisJCQlhbWRncHVfZGV2aWNlX2lwX2Js
b2NrX2FkZChhZGV2LCAmdmVnYTEwX2loX2lwX2Jsb2NrKTsNCisJCX0gZWxzZSB7DQorCQkJYW1k
Z3B1X2RldmljZV9pcF9ibG9ja19hZGQoYWRldiwgJnZlZ2ExMF9paF9pcF9ibG9jayk7DQorCQkJ
aWYgKGxpa2VseShhZGV2LT5maXJtd2FyZS5sb2FkX3R5cGUgPT0gQU1ER1BVX0ZXX0xPQURfUFNQ
KSkNCisJCQkJYW1kZ3B1X2RldmljZV9pcF9ibG9ja19hZGQoYWRldiwgJnBzcF92MTFfMF9pcF9i
bG9jayk7DQorCQl9DQorDQogCQlpZiAoYWRldi0+ZW5hYmxlX3ZpcnR1YWxfZGlzcGxheSB8fCBh
bWRncHVfc3Jpb3ZfdmYoYWRldikpDQogCQkJYW1kZ3B1X2RldmljZV9pcF9ibG9ja19hZGQoYWRl
diwgJmRjZV92aXJ0dWFsX2lwX2Jsb2NrKTsNCiAJCWFtZGdwdV9kZXZpY2VfaXBfYmxvY2tfYWRk
KGFkZXYsICZnZnhfdjlfMF9pcF9ibG9jayk7DQogCQlhbWRncHVfZGV2aWNlX2lwX2Jsb2NrX2Fk
ZChhZGV2LCAmc2RtYV92NF8wX2lwX2Jsb2NrKTsNCi0JCWFtZGdwdV9kZXZpY2VfaXBfYmxvY2tf
YWRkKGFkZXYsICZzbXVfdjExXzBfaXBfYmxvY2spOw0KKwkJaWYgKCFhbWRncHVfc3Jpb3ZfdmYo
YWRldikpDQorCQkJYW1kZ3B1X2RldmljZV9pcF9ibG9ja19hZGQoYWRldiwgJnNtdV92MTFfMF9p
cF9ibG9jayk7DQorDQogCQlpZiAodW5saWtlbHkoYWRldi0+ZmlybXdhcmUubG9hZF90eXBlID09
IEFNREdQVV9GV19MT0FEX0RJUkVDVCkpDQogCQkJYW1kZ3B1X2RldmljZV9pcF9ibG9ja19hZGQo
YWRldiwgJnZjbl92Ml81X2lwX2Jsb2NrKTsNCiAJCWJyZWFrOw0KLS0gDQoyLjcuNA0KDQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KYW1kLWdmeCBtYWls
aW5nIGxpc3QNCmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngNCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkZyZWVkcmVubyBtYWlsaW5nIGxpc3QKRnJl
ZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2ZyZWVkcmVubw==
