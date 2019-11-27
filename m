Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB9B10AD68
	for <lists+freedreno@lfdr.de>; Wed, 27 Nov 2019 11:16:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E2496E0E7;
	Wed, 27 Nov 2019 10:16:15 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from alexa-out-blr-01.qualcomm.com (alexa-out-blr-01.qualcomm.com
 [103.229.18.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B96D6E0E7;
 Wed, 27 Nov 2019 10:16:13 +0000 (UTC)
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
 by alexa-out-blr-01.qualcomm.com with ESMTP/TLS/AES256-SHA;
 27 Nov 2019 15:46:11 +0530
IronPort-SDR: Qp494lQ+am4ylxGZ8MTvUKCSOUEOfZaZEJDAxZDOv7E88WehlZ/cFjIjgspwTSGMxbK2OOwb/s
 i+y0GQASfJlCr61kIYpVDRtyv1bAitIGVGC7nYQA6e35xfkd7ESYe3lXZtPdom7XBRhIz0dR1c
 baIqfYktoZFarl9JbaHYrKN/X8u6Tdrhx5Pjmi+ut+GvrvtvRohzoXZAIo6nU+7F1T5skt9+3S
 0bgGgLxbr46y51wo1KSGzRw55qI9sOorGOwEdOXUPWgwe/WjPNMcn9m7N1YCzDkzD5GnGYBh0J
 PVtN7Zg4DpiDAzAiZBjKpPed
Received: from dhar-linux.qualcomm.com ([10.204.66.25])
 by ironmsg02-blr.qualcomm.com with ESMTP; 27 Nov 2019 15:46:10 +0530
Received: by dhar-linux.qualcomm.com (Postfix, from userid 2306995)
 id 7652B3B5B; Wed, 27 Nov 2019 15:46:09 +0530 (IST)
From: Shubhashree Dhar <dhar@codeaurora.org>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Date: Wed, 27 Nov 2019 15:46:07 +0530
Message-Id: <1574849767-6376-1-git-send-email-dhar@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Subject: [Freedreno] [PATCH] msm:disp:dpu1: Fix core clk rate in display
 driver
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
Cc: Shubhashree Dhar <dhar@codeaurora.org>, linux-kernel@vger.kernel.org,
 abhinavk@codeaurora.org, robdclark@gmail.com, nganji@codeaurora.org,
 seanpaul@chromium.org, hoegsberg@chromium.org, jsanka@codeaurora.org,
 chandanu@codeaurora.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Rml4IG1heCBjb3JlIGNsayByYXRlIGR1cmluZyBkdCBwYXJzaW5nIGluIGRpc3BsYXkgZHJpdmVy
LgoKU2lnbmVkLW9mZi1ieTogU2h1Ymhhc2hyZWUgRGhhciA8ZGhhckBjb2RlYXVyb3JhLm9yZz4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfaW9fdXRpbC5jIHwgMSArCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vbXNtL2Rpc3AvZHB1MS9kcHVfaW9fdXRpbC5jIGIvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNw
L2RwdTEvZHB1X2lvX3V0aWwuYwppbmRleCAyN2ZiZWI1Li45OTFmZmYxIDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfaW9fdXRpbC5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9pb191dGlsLmMKQEAgLTE4Nyw2ICsxODcsNyBAQCBp
bnQgbXNtX2Rzc19wYXJzZV9jbG9jayhzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2LAogCQkJ
Y29udGludWU7CiAJCW1wLT5jbGtfY29uZmlnW2ldLnJhdGUgPSByYXRlOwogCQltcC0+Y2xrX2Nv
bmZpZ1tpXS50eXBlID0gRFNTX0NMS19QQ0xLOworCQltcC0+Y2xrX2NvbmZpZ1tpXS5tYXhfcmF0
ZSA9IHJhdGU7CiAJfQogCiAJbXAtPm51bV9jbGsgPSBudW1fY2xrOwotLSAKMS45LjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkZyZWVkcmVubyBtYWls
aW5nIGxpc3QKRnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ZyZWVkcmVubw==
