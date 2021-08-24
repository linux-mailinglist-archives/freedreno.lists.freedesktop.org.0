Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4223FC9E7
	for <lists+freedreno@lfdr.de>; Tue, 31 Aug 2021 16:36:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 633736E0A5;
	Tue, 31 Aug 2021 14:36:09 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
X-Greylist: delayed 14628 seconds by postgrey-1.36 at gabe;
 Tue, 24 Aug 2021 11:41:25 UTC
Received: from out203-205-221-164.mail.qq.com (out203-205-221-164.mail.qq.com
 [203.205.221.164])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F4042896C4;
 Tue, 24 Aug 2021 11:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1629805283; bh=XIAM28Z3fXYR7IbU7/TyqjKEa+vznn5NPLK7eadSdKs=;
 h=From:To:Subject:Date;
 b=RhUJvfuVrxHh7yoDgjkuirfPi2DvFa2iDL2ZR6T4g9hn0xJVTjgkQz02qTCFQ1cKk
 5+s7cfbkW/j9JwQLtLE7mKunXDVZwj7X0BjgbaISSz7oceIYRfAvUTSEnCcUmrD552
 F5zNRfs2Q4OVfvpOq48Hj6sroP5d7Yh5GPkCc5nY=
X-QQ-FEAT: 3C1WcPM5lQ5tbp5z0bMsuB5BjaW3SL9m0FwUaVuddoM=
X-QQ-SSF: 0000000000000010
X-QQ-XMAILINFO: OcC4JLN881G4YExs8+v6wRPRMOUQpiLr+EBEsNQ33tNaeDmCdm9/CqVm0BnSCW
 AQu569IaCvq2Gtln6+1n1/RcoSdc1UAzaiOr+BaBYYOU+2pla4YjfjnaxNX81E5WSCVRkC2GzjJDA
 3JSieyw29RoS/ZMGvOu//yg4K3+46ywNk5SbxR5/sNg96OC10nGHi35aJv02XzLNYcvyXjCcjQqEK
 DZS+Dx4M35p2ohtU5Xc0iQQMbIWjb0k83TdnIc73sODFevkVG9bh/R0g2ihJHJP3FrT7tKZnRwc8j
 2TiP2H/VA1Uhu9zKlqfG/crwNyFo+sULO8g5NJqPwAkw56hIC8PT22bNGszquc5HOnQCT2h+OX4cU
 ACChbNN3CKcidkTr9h8SixzWQFO/PbZ6aIvr0JdzQjbx1D3fjRgGUyAxB84Rn9YbqABC3ghrBPKFE
 Sx3CczATbYfjQfRgqNdoBFnWZ1pvCJW6QpqivkWhaXQ/f1h9VrUEklEuChRrPnAn9sALVrSBYhZ3L
 lbndDp95zDDyOtc4ekOr7PDcXB4YyIRA/Dn3AUWvmEiIBTh2IPHkFJ4MhW2g1G/if/B2IU98EKWm0
 mzBhBl0ohrBNAChrUtXKReMAsGtcq7NVNFaNAMgPx8WkRorstF0+wwBbc4eWd0Up3a1M8moN82slp
 B0CxTHJQnRCoD5vOWLKt4w6LbT2lYtbEFfONWpt/M/FBY5Mu61hyRXc4A1MnCm4Ur2SpRIQ1d/kpV
 C2myAjC1gtcf4l3uYd/km0UJWD7erC893Rp9ZQUdGXWovYLbRZU0o5BLC+U4IZ4u80sj/uhoSbXb+
 it/gqXR8eq1AxwIRwfdjT+41iCLfIw3EcrqjuIPBsz5I/d3XxwNqSTQ=
X-QQ-WAPMAIL: 1
X-QQ-BUSINESS-ORIGIN: 2
X-Originating-IP: 117.61.86.227
X-QQ-STYLE: 
X-QQ-mid: riamail60t1629790654t6870111
From: "=?utf-8?B?TUMgcGxheWVy?=" <3121917003@qq.com>
To: "=?utf-8?B?ZnJlZWRyZW5v?=" <freedreno@lists.freedesktop.org>,
 "=?utf-8?B?bWVzYS11c2Vycw==?=" <mesa-users@lists.freedesktop.org>
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="----=_NextPart_6124A1BE_11B66F40_65F30397"
Content-Transfer-Encoding: 8Bit
Date: Tue, 24 Aug 2021 15:37:34 +0800
X-Priority: 3
Message-ID: <tencent_FFCAD18733F4CDF50ADADC8BCE6A1B009406@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
X-Mailman-Approved-At: Tue, 31 Aug 2021 14:36:08 +0000
Subject: [Freedreno] How OSMesa bootstraps the GL renderer to output to main
 memory
X-BeenThere: freedreno@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.

------=_NextPart_6124A1BE_11B66F40_65F30397
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SG93IE9TTWVzYSBib290c3RyYXBzIHRoZSBHTCByZW5kZXJlciB0byBvdXRwdXQgdG8gbWFp
biBtZW1vcnk/IEkgaGF2ZSBzZWVuIE9zbWVzYSBzb3VyY2UgY29kZSwgYnV0IEkgZG9uJ3Qg
a25vdyBtdWNoLiBJIGd1ZXNzIE9zbWVzYSBpcyBzb21lIG9mIHRoZSBpbmZvcm1hdGlvbiBp
bnNpZGUgdGhlIEdMIGNvbnRleHQgdG8gYm9vdCB0aGUgb3V0cHV0IGxvY2F0aW9uIG9mIHRo
ZSByZW5kZXJlciwgYnV0IEkgYW0gdW5jZXJ0YWluLCBjYW4gYW55b25lIHRlbGwgbWUgc29t
ZSBtb3JlIGRldGFpbGVkIHRoaW5ncz8NCkkgYW0gdHJ5aW5nIHRvIG1ha2UgVnVsa2FuIG91
dHB1dCB0byB0aGUgc3VyZmFjZSBjcmVhdGVkIGJ5IEVHTCwgYnV0IEkgZG9uJ3Qga25vdyBo
b3cgdG8gImJvb3QiIFZLLCBidXQgSSBzZWUgT1NNRVNBIHRvIG1ha2UgWmluayB0byB0aGUg
Y2xpZW50IG1lbW9yeS4gU28gSSBndWVzcyB3aGV0aGVyIHRoaXMgaXMgcmVsYXRlZCB0byB0
aGUgaW5mb3JtYXRpb24gc3RvcmVkIHdpdGggdGhlIGNvbnRleHQgSW4gYWRkaXRpb24sIEkg
ZG9uJ3Qga25vdyB3aGF0IGNoYW5nZXMgd2lsbCBiZSBtYWRlIGFmdGVyIHRoZSBjb250ZXh0
IGlzIGJvdW5kIHRvIHRoZSB3aW5kb3cu

------=_NextPart_6124A1BE_11B66F40_65F30397
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PG1ldGEgaHR0cC1lcXVpdj0iQ29udGVudC1UeXBlIiBjb250ZW50PSJ0ZXh0L2h0bWw7IGNo
YXJzZXQ9VVRGLTgiPjxkaXY+SG93IE9TTWVzYSBib290c3RyYXBzIHRoZSBHTCByZW5kZXJl
ciB0byBvdXRwdXQgdG8gbWFpbiBtZW1vcnk/IEkgaGF2ZSBzZWVuIE9zbWVzYSBzb3VyY2Ug
Y29kZSwgYnV0IEkgZG9uJ3Qga25vdyBtdWNoLiBJIGd1ZXNzIE9zbWVzYSBpcyBzb21lIG9m
IHRoZSBpbmZvcm1hdGlvbiBpbnNpZGUgdGhlIEdMIGNvbnRleHQgdG8gYm9vdCB0aGUgb3V0
cHV0IGxvY2F0aW9uIG9mIHRoZSByZW5kZXJlciwgYnV0IEkgYW0gdW5jZXJ0YWluLCBjYW4g
YW55b25lIHRlbGwgbWUgc29tZSBtb3JlIGRldGFpbGVkIHRoaW5ncz88L2Rpdj48ZGl2Pkkg
YW0gdHJ5aW5nIHRvIG1ha2UgVnVsa2FuIG91dHB1dCB0byB0aGUgc3VyZmFjZSBjcmVhdGVk
IGJ5IEVHTCwgYnV0IEkgZG9uJ3Qga25vdyBob3cgdG8gImJvb3QiIFZLLCBidXQgSSBzZWUg
T1NNRVNBIHRvIG1ha2UgWmluayB0byB0aGUgY2xpZW50IG1lbW9yeS4gU28gSSBndWVzcyB3
aGV0aGVyIHRoaXMgaXMgcmVsYXRlZCB0byB0aGUgaW5mb3JtYXRpb24gc3RvcmVkIHdpdGgg
dGhlIGNvbnRleHQgSW4gYWRkaXRpb24sIEkgZG9uJ3Qga25vdyB3aGF0IGNoYW5nZXMgd2ls
bCBiZSBtYWRlIGFmdGVyIHRoZSBjb250ZXh0IGlzIGJvdW5kIHRvIHRoZSB3aW5kb3cuPC9k
aXY+PGRpdj48IS0tZW1wdHlzaWduLS0+PC9kaXY+

------=_NextPart_6124A1BE_11B66F40_65F30397--

