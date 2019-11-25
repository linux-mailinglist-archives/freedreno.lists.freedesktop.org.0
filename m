Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE46108D71
	for <lists+freedreno@lfdr.de>; Mon, 25 Nov 2019 13:01:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94E1B6E136;
	Mon, 25 Nov 2019 12:00:59 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from alexa-out-blr-02.qualcomm.com (alexa-out-blr-02.qualcomm.com
 [103.229.18.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C50206E136;
 Mon, 25 Nov 2019 12:00:57 +0000 (UTC)
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
 by alexa-out-blr-02.qualcomm.com with ESMTP/TLS/AES256-SHA;
 25 Nov 2019 17:29:57 +0530
IronPort-SDR: fGVvEbj3FbHStOiD96Mom5gthGHa8KO1XYyHL8KQT4lSK5jDoYhy9GFDdyNRMiCfXnWSAAGJ75
 +/dIjDLw5Nj1o1vpbO+k6vIHuXwJzLbSxdpRsKyPnGTJHmyPqcAwDo5SfHx2gqM5gzNLmD42tY
 gCh607ITCmTatSPKQqp4hDYIAh9e0xNJ8yp4ZgQWQaX6wmk4KseFT33Ml8UfV1TbZBsqUKV5KN
 GwPhaRPLNEyQkDanxd5ow47ksSvulK3qIl6YunVQtYt4y5ZlKhWVRjRzVNBFwDXKTF6ZIr0Z/O
 2RuPJ5STTqrkswm+/lv4ZpjQ
Received: from kalyant-linux.qualcomm.com ([10.204.66.210])
 by ironmsg02-blr.qualcomm.com with ESMTP; 25 Nov 2019 17:29:32 +0530
Received: by kalyant-linux.qualcomm.com (Postfix, from userid 94428)
 id 1241C432B; Mon, 25 Nov 2019 17:29:32 +0530 (IST)
From: Kalyan Thota <kalyan_t@codeaurora.org>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Date: Mon, 25 Nov 2019 17:29:25 +0530
Message-Id: <1574683169-19342-1-git-send-email-kalyan_t@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Subject: [Freedreno] [PATCH 0/4] Add support for SC7180 display
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
Cc: dhar@codeaurora.org, travitej@codeaurora.org, linux-kernel@vger.kernel.org,
 robdclark@gmail.com, nganji@codeaurora.org, seanpaul@chromium.org,
 Kalyan Thota <kalyan_t@codeaurora.org>, hoegsberg@chromium.org,
 jsanka@codeaurora.org, chandanu@codeaurora.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

U0M3MTgwIGZvbGxvd3MgYSBuZXdlciBhcmNoaXRlY3R1cmUgd2hlcmUgaW4gc29tZSBmbHVzaCBj
b250cm9scyBoYXZlIGJlZW4gcmUtb3JnYW5pemVkIHRvIHNpbXBsaWZ5IHByb2dyYW1taW5nIGFu
ZCBwcm92aWRlIGZvciBmdXR1cmUgZXhwYW5kYWJpbGl0eS4KU3BlY2lmaWNhbGx5OgoxKSBUaGUg
VElNSU5HXzxqPiBiaXRzIHRoYXQgY29udHJvbCBmbHVzaCBvZiBJTlRGXzxqPiBoYXZlIGJlZW4g
cmVwbGFjZWQgd2l0aCBhIGNvbW1vbiBJTlRGIGZsdXNoIGJpdCB3aGljaCBmbHVzaGVzIHRoZSBw
cm9ncmFtbWluZyBpbiB0aGUgTURQX0NUTF88aWQ+X0lOVEZfQUNUSVZFIHJlZ2lzdGVyCjIpIElu
ZGl2aWR1YWwgZmx1c2ggYml0cyBmb3IgTUVSR0VfM0QsIERTQyBhbmQgQ0RXTiBoYXZlIGJlZW4g
YWRkZWQgd2hpY2ggZmx1c2ggdGhlIHByb2dyYW1taW5nIGluIHRoZSBNRFBfQ1RMXzxpZD5fTUVS
R0VfM0RfQUNUSVZFLCAuLi4gZXRjIHJlc3BlY3RpdmVseQozKSBQRVJJUEggZmx1c2ggYml0IGhh
cyBiZWVuIGFkZGVkIHRvIGZsdXNoIERTUCBwYWNrZXRzIGZvciBEaXNwbGF5UG9ydAoKVGhlIGNv
bXBsZXRlIGRhdGFwYXRoIGlzIGRlc2NyaWJlZCB1c2luZyB0aGUgTURQX0NUTF88aWQ+X1RPUCBh
bmQgbmV3bHkgYWRkZWQgQUNUSVZFIHJlZ2lzdGVycyB0byBoYW5kbGUgb3RoZXIgc3ViIGJsb2Nr
cwpzdWNoIGFzIGludGVyZmFjZSAoSU5URikgcmVzb3VyY2VzLCBQaW5nUG9uZyBidWZmZXIgLyBM
YXllciBNaXhlciwgRGlzcGxheSBTdHJlYW0gQ29tcHJlc3Npb24gKERTQykgcmVzb3VyY2VzLCB3
cml0ZWJhY2sgKFdCKSBhbmQgM0QgTWVyZ2UKc2VsZWN0aW9ucyB0aGF0IGFyZSBwYXJ0IG9mIHRo
ZSBkYXRhcGF0aC4KCkthbHlhbiBUaG90YSAoNCk6CiAgZHQtYmluZGluZ3M6IG1zbTpkaXNwOiBh
ZGQgc2M3MTgwIERQVSB2YXJpYW50CiAgbXNtOmRpc3A6ZHB1MTogYWRkIHN1cHBvcnQgZm9yIGRp
c3BsYXkgZm9yIFNDNzE4MCB0YXJnZXQKICBtc206ZGlzcDpkcHUxOiBzZXR1cCBkaXNwbGF5IGRh
dGFwYXRoIGZvciBTQzcxODAgdGFyZ2V0CiAgbXNtOmRpc3A6ZHB1MTogYWRkIG1peGVyIHNlbGVj
dGlvbiBmb3IgZGlzcGxheSB0b3BvbG9neQoKIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3Bs
YXkvbXNtL2RwdS50eHQgICAgICAgIHwgICA0ICstCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3Av
ZHB1MS9kcHVfZW5jb2Rlci5jICAgICAgICB8ICAyMSArKy0KIC4uLi9ncHUvZHJtL21zbS9kaXNw
L2RwdTEvZHB1X2VuY29kZXJfcGh5c192aWQuYyAgIHwgIDIxICsrLQogZHJpdmVycy9ncHUvZHJt
L21zbS9kaXNwL2RwdTEvZHB1X2h3X2NhdGFsb2cuYyAgICAgfCAxOTEgKysrKysrKysrKysrKysr
KysrKy0tCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfaHdfY2F0YWxvZy5oICAg
ICB8ICAgNiArCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfaHdfY3RsLmMgICAg
ICAgICB8ICA4NCArKysrKysrKy0KIGRyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9o
d19jdGwuaCAgICAgICAgIHwgIDI0ICsrKwogZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEv
ZHB1X2h3X2ludGYuYyAgICAgICAgfCAgMjggKysrCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3Av
ZHB1MS9kcHVfaHdfaW50Zi5oICAgICAgICB8ICAgNiArCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2Rp
c3AvZHB1MS9kcHVfaHdfbG0uYyAgICAgICAgICB8ICAgMyArLQogZHJpdmVycy9ncHUvZHJtL21z
bS9kaXNwL2RwdTEvZHB1X2ttcy5jICAgICAgICAgICAgfCAgIDEgKwogZHJpdmVycy9ncHUvZHJt
L21zbS9tc21fZHJ2LmMgICAgICAgICAgICAgICAgICAgICAgfCAgIDQgKy0KIDEyIGZpbGVzIGNo
YW5nZWQsIDM3MCBpbnNlcnRpb25zKCspLCAyMyBkZWxldGlvbnMoLSkKCi0tIAoxLjkuMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KRnJlZWRyZW5vIG1h
aWxpbmcgbGlzdApGcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZnJlZWRyZW5v
