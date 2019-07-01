Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 355855C328
	for <lists+freedreno@lfdr.de>; Mon,  1 Jul 2019 20:39:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E562989BB2;
	Mon,  1 Jul 2019 18:39:53 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38F9689BB2;
 Mon,  1 Jul 2019 18:39:52 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id 14D94605FC; Mon,  1 Jul 2019 18:39:52 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
 version=3.4.0
Received: from [10.226.58.28] (i-global254.qualcomm.com [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: jhugo@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 940AD6028D;
 Mon,  1 Jul 2019 18:39:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 940AD6028D
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
References: <20190630150230.7878-1-robdclark@gmail.com>
 <20190630150230.7878-6-robdclark@gmail.com>
From: Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <a40e7406-892b-f3be-f309-8857085ff3c5@codeaurora.org>
Date: Mon, 1 Jul 2019 12:39:49 -0600
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190630150230.7878-6-robdclark@gmail.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1562006392;
 bh=ecZCP0Nl2MvYdNc2PJ+G+AX8dhZHCBiv1DZ4bQurLhc=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=K/7usMnyAV2CIYxBNfXpgHdLeUMcCsknMVpBP35DHG2V+UP+hO6D8curADy8aiAft
 Biu1fmmU9WljiNeyT/cLwG5iLPqK5kqaB/H4nusUnygVqhPI3PtNMPrIK7+/N5IFZW
 jRWgCBNuydCHB+iRf1NFKq/nLZBES/g5zvsrkysw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1562006391;
 bh=ecZCP0Nl2MvYdNc2PJ+G+AX8dhZHCBiv1DZ4bQurLhc=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=OlYrV+PUD/QozjpxBy2p/EieCA4QwtgFpf13ybP2lZ1OJzn7NTcA4yuynVe5574ii
 Iqwo5W9FnzbP1OnSrgw4D0AjS7DcxVksD6f56ry8riJziBcSajIse6WrviiA8RxFn9
 sBdm4CuecGHdplapbI7tQsVpd006yMuIWj0OknR0=
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 dmarc=none (p=none dis=none)
 header.from=codeaurora.org
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 spf=none
 smtp.mailfrom=jhugo@codeaurora.org
Subject: Re: [Freedreno] [PATCH 5/5] drm/bridge: ti-sn65dsi86: support
 booloader enabled display
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
Cc: Rob Clark <robdclark@chromium.org>, aarch64-laptops@lists.linaro.org,
 linux-pm@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org,
 linux-clk@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

T24gNi8zMC8yMDE5IDk6MDEgQU0sIFJvYiBDbGFyayB3cm90ZToKPiBGcm9tOiBSb2IgQ2xhcmsg
PHJvYmRjbGFya0BjaHJvbWl1bS5vcmc+Cj4gCj4gUmVxdWVzdCB0aGUgZW5hYmxlIGdwaW8gQVNJ
UyB0byBhdm9pZCBkaXNhYmxpbmcgYnJpZGdlIGR1cmluZyBwcm9iZSwgaWYKPiBhbHJlYWR5IGVu
YWJsZWQuICBBbmQgaWYgYWxyZWFkeSBlbmFibGVkLCBkZWZlciBlbmFibGluZyBydW5wbSB1bnRp
bAo+IGF0dGFjaCB0byBhdm9pZCBjdXR0aW5nIG9mZiB0aGUgcG93ZXIgdG8gdGhlIGJyaWRnZS4K
PiAKPiBPbmNlIHdlIGdldCB0byBhdHRhY2gsIHdlIGtub3cgcGFuZWwgYW5kIGRybSBkcml2ZXIg
YXJlIHByb2JlZAo+IHN1Y2Nlc3NmdWxseSwgc28gYXQgdGhpcyBwb2ludCBpdCBpIHMgc2FmZSB0
byBlbmFibGUgcnVucG0gYW5kIHJlc2V0IHRoZQoKaXM/Cgo+IGJyaWRnZS4gIElmIHdlIGRvIGl0
IGVhcmxpZXIsIHdlIGtpbGwgZWZpZmIgKGluIHRoZSBjYXNlIHRoYXQgcGFuZWwgb3IKPiBkcm0g
ZHJpdmVyIGRvIG5vdCBwcm9iZSBzdWNjZXNzZnVsbHksIGdpdmluZyB0aGUgdXNlciBubyB3YXkg
dG8gc2VlIHdoYXQKPiBpcyBnb2luZyBvbi4KCldoZXJlIHNob3VsZCB0aGUgbWlzc2luZyAiKSIg
YmU/CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KRnJl
ZWRyZW5vIG1haWxpbmcgbGlzdApGcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZnJlZWRyZW5v
