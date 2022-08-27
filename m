Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D005A3371
	for <lists+freedreno@lfdr.de>; Sat, 27 Aug 2022 03:24:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3246010EB07;
	Sat, 27 Aug 2022 01:24:45 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
X-Greylist: delayed 304 seconds by postgrey-1.36 at gabe;
 Sat, 27 Aug 2022 01:24:42 UTC
Received: from mailgw.kylinos.cn (unknown [124.126.103.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2534210EB07
 for <freedreno@lists.freedesktop.org>; Sat, 27 Aug 2022 01:24:41 +0000 (UTC)
X-UUID: 5009da63b2f94f519724e26bc2b707ea-20220827
X-UUID: 5009da63b2f94f519724e26bc2b707ea-20220827
Received: from cs2c.com.cn [(192.168.0.8)] by mailgw
 (envelope-from <sunliming@kylinos.cn>) (Generic MTA)
 with ESMTP id 429498446; Sat, 27 Aug 2022 09:19:48 +0800
Received: by cs2c.com.cn (NSMail, from userid 0)
 id 9590D182C2923; Sat, 27 Aug 2022 09:19:31 +0800 (CST)
From: =?UTF-8?B?5a2Z56uL5piO?= <sunliming@kylinos.cn>
To: =?UTF-8?B?QWJoaW5hdiBLdW1hcg==?= <quic_abhinavk@quicinc.com>,
 <christian.koenig@amd.com>, <robdclark@gmail.com>,
 <dmitry.baryshkov@linaro.org>,
Date: Sat, 27 Aug 2022 09:19:31 +0800
X-Mailer: NSMAIL 6.0
Message-ID: <1m2x504li73-1m2zovrfluo@nsmail6.0>
References: b190ff71-fdf4-9fe3-56ee-456665b48237@quicinc.com
X-Delaysendtime: Sat, 27 Aug 2022 09:19:31 +0800
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary=nsmail-1m3vld6vvj6-1m3vld6vvj7
X-ns-mid: webmail-63097123-1m30ytku
Subject: [Freedreno] =?utf-8?b?5Zue5aSNOiBSZTogW1BBVENIIFJFU0VORF0gZHJt?=
 =?utf-8?q?/msm/dsi=3A_fix_the_inconsistent_indenting?=
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
Cc: inux-arm-msm@vger.kernel.org, kelulanainsley@gmail.com,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 =?UTF-8?B?a2VybmVsIHRlc3Qgcm9ib3Q=?= <lkp@intel.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

This message is in MIME format.

--nsmail-1m3vld6vvj6-1m3vld6vvj7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

CiAmbmJzcDsgJm5ic3A7T0ssIEkgYW0gc29ycnkuIFRoYW5rczxicj48YnI+
PGJyPgoKICZuYnNwOyAmbmJzcDs8cD4tLS0tPC9wPjxkaXYgaWQ9ImNzMmNf
bWFpbF9zaWdhdHVyZSI+PHA+PC9wPjxwPjxicj48L3A+PC9kaXY+PHA+PC9w
PjxkaXYgaWQ9InJlIiBzdHlsZT0ibWFyZ2luLWxlZnQ6MC41ZW07cGFkZGlu
Zy1sZWZ0OjAuNWVtO2JvcmRlci1sZWZ0OjFweCBzb2xpZCBncmVlbjsiPjxi
cj48YnI+PGJyPgogJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7PGRpdiBz
dHlsZT0iYmFja2dyb3VuZC1jb2xvcjojZjVmN2ZhIj48Yj7kuLvjgIDpopjv
vJo8L2I+PHNwYW4gaWQ9InN1YmplY3QiPlJlOiBbUEFUQ0ggUkVTRU5EXSBk
cm0vbXNtL2RzaTogZml4IHRoZSBpbmNvbnNpc3RlbnQgaW5kZW50aW5nPC9z
cGFuPgogJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJz
cDs8YnI+PGI+5pel44CA5pyf77yaPC9iPjxzcGFuIGlkPSJkYXRlIj4yMDIy
LTA4LTI3IDAwOjEwPC9zcGFuPgogJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5i
c3A7ICZuYnNwOyAmbmJzcDs8YnI+PGI+5Y+R5Lu25Lq677yaPC9iPjxzcGFu
IGlkPSJmcm9tIj5BYmhpbmF2IEt1bWFyPC9zcGFuPgogJm5ic3A7ICZuYnNw
OyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDs8YnI+PGI+5pS25Lu25Lq6
77yaPC9iPjxzcGFuIGlkPSJ0byI+5a2Z56uL5piOY2hyaXN0aWFuLmtvZW5p
Z0BhbWQuY29tcm9iZGNsYXJrQGdtYWlsLmNvbWRtaXRyeS5iYXJ5c2hrb3ZA
bGluYXJvLm9yZzwvc3Bhbj4KICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNw
OyAmbmJzcDsgJm5ic3A7CiAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDs8
L2Rpdj48YnI+CiAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDs8ZGl2IGlk
PSJjb250ZW50Ij48ZGl2IGNsYXNzPSJ2aWV3ZXJfcGFydCI+PGRpdj48YnI+
PGJyPk9uIDgvMjYvMjAyMiAxOjQ5IEFNLCBzdW5saW1pbmcgd3JvdGU6PGJy
PiZndDsgRml4IHRoZSBpbmNvbnNpc3RlbnQgaW5kZW50aW5nIGluIGZ1bmN0
aW9uIG1zbV9kc2lfZHBoeV90aW1pbmdfY2FsY192MygpLjxicj4mZ3Q7IDxi
cj4mZ3Q7IEZpeCB0aGUgZm9sbG93aW5nIHNtYXRjaCB3YXJuaW5nczo8YnI+
Jmd0OyA8YnI+Jmd0OyBkcml2ZXJzL2dwdS9kcm0vbXNtL2RzaS9waHkvZHNp
X3BoeS5jOjM1MCBtc21fZHNpX2RwaHlfdGltaW5nX2NhbGNfdjMoKSB3YXJu
OiBpbmNvbnNpc3RlbnQgaW5kZW50aW5nPGJyPiZndDsgPGJyPiZndDsgRml4
ZXM6IGYxZmE3ZmY0NDA1NiAoImRybS9tc20vZHNpOiBpbXBsZW1lbnQgYXV0
byBQSFkgdGltaW5nIGNhbGN1bGF0b3IgZm9yIDEwbm0gUEhZIik8YnI+Jmd0
OyBSZXBvcnRlZC1ieToga2VybmVsIHRlc3Qgcm9ib3QgJmx0O2xrcEBpbnRl
bC5jb20mZ3Q7PGJyPiZndDsgU2lnbmVkLW9mZi1ieTogc3VubGltaW5nICZs
dDtzdW5saW1pbmdAa3lsaW5vcy5jbiZndDs8YnI+Jmd0OyBSZXZpZXdlZC1i
eTogQWJoaW5hdiBLdW1hciAmbHQ7cXVpY19hYmhpbmF2a0BxdWljaW5jLmNv
bSZndDs8YnI+VGhlcmUgaXMgbm8gbmVlZCB0byByZXNlbmQgdGhpcy4gVGhp
cyB3YXMgYWxyZWFkeSBhcHBsaWVkIHRvIG1zbS1maXhlczxicj48YnI+aHR0
cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2RybS9tc20vLS9jb21taXQv
MmYyNWExZmI0ZWM1MTZjNWFkNjdhZmQ3NTQzMzRiNDkxYjlmMDlhNTxicj48
YnI+Jmd0OyAtLS08YnI+Jmd0OyAmbmJzcDsgZHJpdmVycy9ncHUvZHJtL21z
bS9kc2kvcGh5L2RzaV9waHkuYyB8IDIgKy08YnI+Jmd0OyAmbmJzcDsgMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pPGJy
PiZndDsgPGJyPiZndDsgZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9t
c20vZHNpL3BoeS9kc2lfcGh5LmMgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rz
aS9waHkvZHNpX3BoeS5jPGJyPiZndDsgaW5kZXggYTM5ZGUzYmRjN2ZhLi41
NmRmYTJkMjRiZTEgMTAwNjQ0PGJyPiZndDsgLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL21zbS9kc2kvcGh5L2RzaV9waHkuYzxicj4mZ3Q7ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9tc20vZHNpL3BoeS9kc2lfcGh5LmM8YnI+Jmd0OyBAQCAt
MzQ3LDcgKzM0Nyw3IEBAIGludCBtc21fZHNpX2RwaHlfdGltaW5nX2NhbGNf
djMoc3RydWN0IG1zbV9kc2lfZHBoeV90aW1pbmcgKnRpbWluZyw8YnI+Jmd0
OyAmbmJzcDsgCX0gZWxzZSB7PGJyPiZndDsgJm5ic3A7IAkJdGltaW5nLSZn
dDtzaGFyZWRfdGltaW5ncy5jbGtfcHJlID08YnI+Jmd0OyAmbmJzcDsgCQkJ
bGluZWFyX2ludGVyKHRtYXgsIHRtaW4sIHBjbnQyLCAwLCBmYWxzZSk7PGJy
PiZndDsgLQkJCXRpbWluZy0mZ3Q7c2hhcmVkX3RpbWluZ3MuY2xrX3ByZV9p
bmNfYnlfMiA9IDA7PGJyPiZndDsgKwkJdGltaW5nLSZndDtzaGFyZWRfdGlt
aW5ncy5jbGtfcHJlX2luY19ieV8yID0gMDs8YnI+Jmd0OyAmbmJzcDsgCX08
YnI+Jmd0OyAmbmJzcDsgPGJyPiZndDsgJm5ic3A7IAl0aW1pbmctJmd0O3Rh
X2dvID0gMzs8YnI+PC9kaXY+PC9kaXY+PC9kaXY+PC9kaXY+

--nsmail-1m3vld6vvj6-1m3vld6vvj7--
