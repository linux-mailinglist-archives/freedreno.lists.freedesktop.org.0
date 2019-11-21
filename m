Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 228F9104AA5
	for <lists+freedreno@lfdr.de>; Thu, 21 Nov 2019 07:19:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C17D06E7B0;
	Thu, 21 Nov 2019 06:19:48 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730044.outbound.protection.outlook.com [40.107.73.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49D3E6E7B0
 for <freedreno@lists.freedesktop.org>; Thu, 21 Nov 2019 06:19:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bO6T+oYyslNm59n/LP7ccW4nHgclRSFmmsaLeN+HMEbuSnXoXzVKoquMCoaE4uMUt8L/XU1wZ+AH7XuA/utNvvSCk71b15hu3xSJr7IOg6s1in8Sk7GCShuhJOvk0zOGDl7pWyA8tbz2Gb9zeJlHxEx57zyTb3DDK3kV1iBehDFB98fyXSPGSxIgjTuUpFCaQ6AGp0QV/JMF/m2nb5fFIgbSw2kJxT9U0djaCFmWnCCgw0AHgAk17dJYGqnPo1RTUGPoZIkHLeIy8JIFXX5+E5B82SbuBjsZaeQqD5NXYr5VIAZA+3St8vZ3iCmLD+3klM/pcTyVOFK34D6Xjc2agQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mtUKSM1rGtwmFUshBIX/xLKNG19UE9HSKANUGpoqszI=;
 b=a65gaV1HtrbUpJF19Tw9iSL97rH2g4CBVyP0GzVLqixzp+yPKH+RdF1S0T+FgcP23I9LQ1qkTMQ2M2ImBkuXiQxsOPyr7YdF+3pQUdevzHylNw2YoMGsY12/KROGDOpftCk8kbjjQQz2w/RVx2mbMJsSBEa4g7iKyuXkVcwMldgsujVjhTmUgOoSQvqoxzYJ4VB+75Xs/iKcS7hcZFhUA0aJpdJxPvgDCdq7s5gjbYpYwVkesD+ZW4GURIM8Ew+VyOaIzh7xzd6Cu0NhlusI8ubAvwqfREKfoObBuEWYe+G1pR7KD6EycYR06H60aCP9Mf0vhEOqAIs0io2+HOPqqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB3675.namprd12.prod.outlook.com (10.255.76.80) by
 DM6PR12MB3835.namprd12.prod.outlook.com (10.255.173.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.16; Thu, 21 Nov 2019 06:19:46 +0000
Received: from DM6PR12MB3675.namprd12.prod.outlook.com
 ([fe80::843a:9b15:db63:1159]) by DM6PR12MB3675.namprd12.prod.outlook.com
 ([fe80::843a:9b15:db63:1159%7]) with mapi id 15.20.2474.019; Thu, 21 Nov 2019
 06:19:46 +0000
From: "Zhang, Jack (Jian)" <Jack.Zhang1@amd.com>
To: "Ma, Le" <Le.Ma@amd.com>, "Cui, Flora" <Flora.Cui@amd.com>, "Xu, Feifei"
 <Feifei.Xu@amd.com>
Thread-Topic: [PATCH 2/2] drm/amd/amdgpu/sriov skip RLCG s/r list for arcturus
 VF.
Thread-Index: AQHVoDNRPUWxG4MvOEeir6J4XVb8g6eVJr0A
Date: Thu, 21 Nov 2019 06:19:46 +0000
Message-ID: <DM6PR12MB3675AD4B1900A46ED0AF2F13BB4E0@DM6PR12MB3675.namprd12.prod.outlook.com>
References: <20191121061707.25958-1-Jack.Zhang1@amd.com>
In-Reply-To: <20191121061707.25958-1-Jack.Zhang1@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: c8b64ebb-e738-44ec-6801-08d76e4ace8b
x-ms-traffictypediagnostic: DM6PR12MB3835:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB3835C8E155F35F50A858BFA9BB4E0@DM6PR12MB3835.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0228DDDDD7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(376002)(366004)(136003)(346002)(13464003)(189003)(199004)(110136005)(86362001)(7736002)(305945005)(7696005)(229853002)(76176011)(4326008)(52536014)(6636002)(316002)(53546011)(6506007)(26005)(74316002)(186003)(55016002)(6436002)(9686003)(102836004)(6246003)(256004)(14444005)(5660300002)(99286004)(2906002)(3846002)(6116002)(71200400001)(446003)(11346002)(486006)(71190400001)(476003)(66066001)(478600001)(33656002)(76116006)(8936002)(81166006)(81156014)(66946007)(66446008)(64756008)(66556008)(66476007)(14454004)(25786009)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3835;
 H:DM6PR12MB3675.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Oc0fQvpTitbsraFydLoZJrPy6M8toWN+MrQIHORf3p+uKzjWkRhgr5Le72bRpwgLHY4K7muXy4dTMuYgeoTB1fCDLESO/fZlTrWJGZoY5PjjB6PJRJTMZGDq85ufGtL5rd7xFC9f6/5Y9HGcBIrieSBSahoZ7oA83MMVfu87zSDsWNNh0jaHUnlmQbBYVmzxTf/OJcsduSzFZ0eEdDXKeCAvzV/bTo90xDr26BFOklVvHMYO1sWHcHD/bAeF7wGtvLidocmO7Hllhyp0O0FP4En+/IlMdidr10NK4T/W3ch3kyo7Zcj294Qz+4GYto3DIbcK7Z81yDamE510lR3cm2JNgdOijkXmtxRCZDq+bSRDb60Gdn3j1xC/gAN797fBKwdsidTDalDZ7/2MBIvMBTQymBnI36ZamwddIEMG2ry7nSfSqgW8y8sdNlbjpZ+U
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8b64ebb-e738-44ec-6801-08d76e4ace8b
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2019 06:19:46.6453 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /ejiP9qh0r6E5IYysib3gc/q64jmWIG9rYou/uj+jSAfN6aUp5mQwEMBQX0MG3IH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3835
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mtUKSM1rGtwmFUshBIX/xLKNG19UE9HSKANUGpoqszI=;
 b=t/c3FeVpOMuW7RO0tuiokN/L8DfWPo0bMDz5eyabDx83kOfP4hg2/FSI410eeZAZISbUTATsio+1J0IAROivUlpZhxXWI8xzzKIhgT0L9HePRQ1IgBHhg/TMVYtX1bzYrOp7Vh6nLuwL1vvL74fXfyfoi1cRB/pEZQxqnTHxWzs=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Jack.Zhang1@amd.com; 
Subject: Re: [Freedreno] [PATCH 2/2] drm/amd/amdgpu/sriov skip RLCG s/r list
 for arcturus VF.
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

SGksIFRlYW0sCgpXb3VsZCB5b3UgcGxlYXNlIGhlbHAgdG8gdGFrZSBhIGxvb2sgdGhpcyBwYXRj
aFsyLzJdPwoKQlIKSmFjawoKLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KRnJvbTogSmFjayBa
aGFuZyA8SmFjay5aaGFuZzFAYW1kLmNvbT4gClNlbnQ6IFRodXJzZGF5LCBOb3ZlbWJlciAyMSwg
MjAxOSAyOjE3IFBNClRvOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogWmhhbmcs
IEphY2sgKEppYW4pIDxKYWNrLlpoYW5nMUBhbWQuY29tPgpTdWJqZWN0OiBbUEFUQ0ggMi8yXSBk
cm0vYW1kL2FtZGdwdS9zcmlvdiBza2lwIFJMQ0cgcy9yIGxpc3QgZm9yIGFyY3R1cnVzIFZGLgoK
QWZ0ZXIgcmxjZyBmdyAyLjEsIGttZCBkcml2ZXIgc3RhcnRzIHRvIGxvYWQgZXh0cmEgZncgZm9y
IExJU1RfQ05UTCxHUE1fTUVNLFNSTV9NRU0uIFdlIG5lZWRzIHRvIHNraXAgdGhlIHRocmVlIGZ3
IGJlY2F1c2UgYWxsIHJsY2cgcmVsYXRlZCBmdyBoYXZlIGJlZW4gbG9hZGVkIGJ5IGhvc3QgZHJp
dmVyLgpHdWVzdCBkcml2ZXIgd291bGQgbG9hZCB0aGUgdGhyZWUgZncgZmFpbCB3aXRob3V0IHRo
aXMgY2hhbmdlLgoKU2lnbmVkLW9mZi1ieTogSmFjayBaaGFuZyA8SmFjay5aaGFuZzFAYW1kLmNv
bT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcHNwLmMgfCA1ICsrKyst
CiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BzcC5jIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BzcC5jCmluZGV4IGMzYTQyZDMuLmVlY2RlODAgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wc3AuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcHNwLmMKQEAgLTE0NzAsNyArMTQ3MCwx
MCBAQCBzdGF0aWMgaW50IHBzcF9ucF9md19sb2FkKHN0cnVjdCBwc3BfY29udGV4dCAqcHNwKQog
CQkgICAgfHwgdWNvZGUtPnVjb2RlX2lkID09IEFNREdQVV9VQ09ERV9JRF9TRE1BNQogCQkgICAg
fHwgdWNvZGUtPnVjb2RlX2lkID09IEFNREdQVV9VQ09ERV9JRF9TRE1BNgogCQkgICAgfHwgdWNv
ZGUtPnVjb2RlX2lkID09IEFNREdQVV9VQ09ERV9JRF9TRE1BNwotCQkgICAgfHwgdWNvZGUtPnVj
b2RlX2lkID09IEFNREdQVV9VQ09ERV9JRF9STENfRykpCisgICAgICAgICAgICAgICAgICAgIHx8
IHVjb2RlLT51Y29kZV9pZCA9PSBBTURHUFVfVUNPREVfSURfUkxDX0cKKwkgICAgICAgICAgICB8
fCB1Y29kZS0+dWNvZGVfaWQgPT0gQU1ER1BVX1VDT0RFX0lEX1JMQ19SRVNUT1JFX0xJU1RfQ05U
TAorCSAgICAgICAgICAgIHx8IHVjb2RlLT51Y29kZV9pZCA9PSBBTURHUFVfVUNPREVfSURfUkxD
X1JFU1RPUkVfTElTVF9HUE1fTUVNCisJICAgICAgICAgICAgfHwgdWNvZGUtPnVjb2RlX2lkID09
IAorQU1ER1BVX1VDT0RFX0lEX1JMQ19SRVNUT1JFX0xJU1RfU1JNX01FTSkpCiAJCQkvKnNraXAg
dWNvZGUgbG9hZGluZyBpbiBTUklPViBWRiAqLwogCQkJY29udGludWU7CiAKLS0KMi43LjQKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkZyZWVkcmVubyBt
YWlsaW5nIGxpc3QKRnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ZyZWVkcmVubw==
