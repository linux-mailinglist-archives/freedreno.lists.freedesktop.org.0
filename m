Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F22C2B6D34
	for <lists+freedreno@lfdr.de>; Wed, 18 Sep 2019 22:02:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A65786FDDF;
	Wed, 18 Sep 2019 20:02:41 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
X-Greylist: delayed 311 seconds by postgrey-1.36 at gabe;
 Wed, 18 Sep 2019 20:02:40 UTC
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E43466FDDF
 for <freedreno@lists.freedesktop.org>; Wed, 18 Sep 2019 20:02:40 +0000 (UTC)
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.129]) with ESMTPA (Nemesis) id
 1MsJXG-1huedC0a0w-00toR3; Wed, 18 Sep 2019 21:57:24 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 18 Sep 2019 21:57:07 +0200
Message-Id: <20190918195722.2149227-1-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:Ej872YyO7HXEU8CNXRPtHdXeVnbz9zTySP1CA1k40z1LeTXe3mj
 agyhpv74Sl7wE8DAVanhlat0KMZliMe8R8ywGa67hfQhJYGlR+KRVMvUxU/wHEUWlUxmbnd
 9LiD638HHbaqYm7Qb6ls3EkcaK//pUD4Q7Dq8hcNQ+MCYIoyM8I2gxs7mCOKKzlOfD8Omq3
 TMgBP/SonrzP8n2XsRq7Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ke0GIv+oLSw=:5uvsP7PlTsi+LlWxMqRRSE
 iDrIgy0pS6Rpy/5Xsc532xxkFbMVGamDKW3M1xBYXujPV3k16RkuhzYvq3bCywpRZmg3UPsVi
 AD5SpRntLgwXtkUdAeYi8kifcqwN+LknPU2BXbLZkBb2Em/8plRPST0qCQwtQSlLqDUR1JvpO
 h0yIpXNHsMbJieqdiTBd0hC1vnHk3rp810vx3ppNzyrjXk+2gBO7gDX+curYewaiRfMdjZ0ud
 Naf2tfKv5FbCjOLhZQjAYkdYhmKZRw8Btznm8B5h5E+zM9JyDwK6Za1rqMnlg+3Ja3QnZY4QZ
 i6oh+LIhg0IFXcTqrrJUw8RWBpDlZwZxbnAmz0+GMhq+6Fekf7i+SFy0+Ps4I6mXmVDYmV+Ch
 WUH8xTgaGNGlYAUVwi0SOcyPwW/F0TXYO/jLJ07RexOG4kroaSzdmIU8FSzXEQt/C7NyV7tTP
 cp7ZqoLezieLL2fw1jGERQ28r9ZhQu9L3oqZFGW3i9djlScIhMsNkCUHK5ccGMJUT9xMtOMkB
 a5wkqtCcLlc91SZGDaCuUjEyUYkW2PBc3mXNkb7W+gpFE6lGU49bpvWQj3YonRvoSUZvNJsig
 iIg5VdWdXIOeCj9yi2C7inHkabUBGL/VTQwPUbRHs6aN+onJWMGrjh+Xj/jOSsj7qU/Y00/nY
 PFykGNak7Ryik7/Ta9pRXgyyEKgK6q3nPU91+TWCNqM4ii7Gi38NBaoBDePnLDbghX+IYye1H
 QsD0vPi6FY6y0n1l/KwkZSEtzjR4W23TRqaxKfc249L5Tw9i1rm+h3XD+ViN8FmZPq6G7zDa+
 4jrQvGsgZSrIiF1NlYwRutER+Dm8kp1r/2/ZjU61xR2ON5Sjq4OejYG1k9H2/G99AFC873JF9
 ur0v7Ok4u+D11dxVUZKA==
Subject: [Freedreno] [PATCH] drm/msm: include linux/sched/task.h
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
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-msm@vger.kernel.org,
 Sharat Masetty <smasetty@codeaurora.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jordan Crouse <jcrouse@codeaurora.org>,
 Sean Paul <seanpaul@chromium.org>, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

V2l0aG91dCB0aGlzIGhlYWRlciBmaWxlLCBjb21waWxlLXRlc3RpbmcgbWF5IHJ1biBpbnRvIGEg
bWlzc2luZwpkZWNsYXJhdGlvbjoKCmRyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2dwdS5jOjQ0NDo0
OiBlcnJvcjogaW1wbGljaXQgZGVjbGFyYXRpb24gb2YgZnVuY3Rpb24gJ3B1dF90YXNrX3N0cnVj
dCcgWy1XZXJyb3IsLVdpbXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlvbl0KCkZpeGVzOiA0ODJm
OTYzMjRhNGUgKCJkcm0vbXNtOiBGaXggdGFzayBkdW1wIGluIGdwdSByZWNvdmVyeSIpClNpZ25l
ZC1vZmYtYnk6IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL21zbS9tc21fZ3B1LmMgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2dwdS5jIGIvZHJpdmVycy9ncHUv
ZHJtL21zbS9tc21fZ3B1LmMKaW5kZXggYTA1MjM2NGE1ZDc0Li5lZGQ0NWY0MzRjY2QgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2dwdS5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9tc20vbXNtX2dwdS5jCkBAIC0xNiw2ICsxNiw3IEBACiAjaW5jbHVkZSA8bGludXgvcG1fb3Bw
Lmg+CiAjaW5jbHVkZSA8bGludXgvZGV2ZnJlcS5oPgogI2luY2x1ZGUgPGxpbnV4L2RldmNvcmVk
dW1wLmg+CisjaW5jbHVkZSA8bGludXgvc2NoZWQvdGFzay5oPgogCiAvKgogICogUG93ZXIgTWFu
YWdlbWVudDoKLS0gCjIuMjAuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KRnJlZWRyZW5vIG1haWxpbmcgbGlzdApGcmVlZHJlbm9AbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZnJlZWRyZW5v
