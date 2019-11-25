Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B16108D60
	for <lists+freedreno@lfdr.de>; Mon, 25 Nov 2019 13:00:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A0276E15B;
	Mon, 25 Nov 2019 12:00:04 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from alexa-out-blr-02.qualcomm.com (alexa-out-blr-02.qualcomm.com
 [103.229.18.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E79E89EB1;
 Mon, 25 Nov 2019 12:00:00 +0000 (UTC)
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
 by alexa-out-blr-02.qualcomm.com with ESMTP/TLS/AES256-SHA;
 25 Nov 2019 17:29:57 +0530
IronPort-SDR: DjLMkUQ55vwMHrheiFK8/tOMOjON+m3bXs8uHpnZu0DZqqyiQ8STF1RMzC/Ylk/keVRAvSIMDE
 MttHmuWjF1VDaV8QrILwl8rVcLwGFMj7JqZpC4P1V0IADqW8DFfCmpZK58Mjkpx0t+g2drgEbG
 xx9icSEPz2sLkIhBdTtyGd0WwSJxR1ojtuWRK9WKtvYYPluJ3RitiNkVViawtBix3uSNc99HMu
 SVQmi5H6qOIvZHC9JZ0mU2osbwC8pwhhpuihoLa9sBshxpnIlmEkNoZgKZqoGbJO4o0+RukAj8
 OJ3j97szcHyng6dJGk6urcJ0
Received: from kalyant-linux.qualcomm.com ([10.204.66.210])
 by ironmsg02-blr.qualcomm.com with ESMTP; 25 Nov 2019 17:29:38 +0530
Received: by kalyant-linux.qualcomm.com (Postfix, from userid 94428)
 id 9E7E6432B; Mon, 25 Nov 2019 17:29:37 +0530 (IST)
From: Kalyan Thota <kalyan_t@codeaurora.org>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Date: Mon, 25 Nov 2019 17:29:26 +0530
Message-Id: <1574683169-19342-2-git-send-email-kalyan_t@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1574683169-19342-1-git-send-email-kalyan_t@codeaurora.org>
References: <1574683169-19342-1-git-send-email-kalyan_t@codeaurora.org>
Subject: [Freedreno] [PATCH 1/4] dt-bindings: msm:disp: add sc7180 DPU
 variant
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

QWRkIGEgY29tcGF0aWJsZSBzdHJpbmcgdG8gc3VwcG9ydCBzYzcxODAgZHB1IHZlcnNpb24uCgpT
aWduZWQtb2ZmLWJ5OiBLYWx5YW4gVGhvdGEgPGthbHlhbl90QGNvZGVhdXJvcmEub3JnPgotLS0K
IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21zbS9kcHUudHh0IHwg
NCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21z
bS9kcHUudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbXNt
L2RwdS50eHQKaW5kZXggYTYxZGQ0MC4uNTUxYWUyNiAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbXNtL2RwdS50eHQKKysrIGIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbXNtL2RwdS50eHQKQEAgLTgsNyArOCw3
IEBAIFRoZSBEUFUgZGlzcGxheSBjb250cm9sbGVyIGlzIGZvdW5kIGluIFNETTg0NSBTb0MuCiAK
IE1EU1M6CiBSZXF1aXJlZCBwcm9wZXJ0aWVzOgotLSBjb21wYXRpYmxlOiAicWNvbSxzZG04NDUt
bWRzcyIKKy0gY29tcGF0aWJsZTogICJxY29tLHNkbTg0NS1tZHNzIiwgInFjb20sc2M3MTgwLW1k
c3MiCiAtIHJlZzogcGh5c2ljYWwgYmFzZSBhZGRyZXNzIGFuZCBsZW5ndGggb2YgY29udG9sbGVy
J3MgcmVnaXN0ZXJzLgogLSByZWctbmFtZXM6IHJlZ2lzdGVyIHJlZ2lvbiBuYW1lcy4gVGhlIGZv
bGxvd2luZyByZWdpb24gaXMgcmVxdWlyZWQ6CiAgICogIm1kc3MiCkBAIC00MSw3ICs0MSw3IEBA
IE9wdGlvbmFsIHByb3BlcnRpZXM6CiAKIE1EUDoKIFJlcXVpcmVkIHByb3BlcnRpZXM6Ci0tIGNv
bXBhdGlibGU6ICJxY29tLHNkbTg0NS1kcHUiCistIGNvbXBhdGlibGU6ICJxY29tLHNkbTg0NS1k
cHUiLCAicWNvbSxzYzcxODAtZHB1IgogLSByZWc6IHBoeXNpY2FsIGJhc2UgYWRkcmVzcyBhbmQg
bGVuZ3RoIG9mIGNvbnRyb2xsZXIncyByZWdpc3RlcnMuCiAtIHJlZy1uYW1lcyA6IHJlZ2lzdGVy
IHJlZ2lvbiBuYW1lcy4gVGhlIGZvbGxvd2luZyByZWdpb24gaXMgcmVxdWlyZWQ6CiAgICogIm1k
cCIKLS0gCjEuOS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpGcmVlZHJlbm8gbWFpbGluZyBsaXN0CkZyZWVkcmVub0BsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9mcmVlZHJl
bm8=
