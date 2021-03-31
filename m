Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 299B53505A1
	for <lists+freedreno@lfdr.de>; Wed, 31 Mar 2021 19:39:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF21D6EB27;
	Wed, 31 Mar 2021 17:39:22 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com
 [IPv6:2607:f8b0:4864:20::c30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7D426EB2D
 for <freedreno@lists.freedesktop.org>; Wed, 31 Mar 2021 17:39:21 +0000 (UTC)
Received: by mail-oo1-xc30.google.com with SMTP id
 i20-20020a4a8d940000b02901bc71746525so4801946ook.2
 for <freedreno@lists.freedesktop.org>; Wed, 31 Mar 2021 10:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kali.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=NkmFG1QTNaWLlvVjiv9pwliViB1M7jgJYDg2EZ3dMok=;
 b=TOLHVqL6Jx5pJUAWNL03GOlOr0ER1zBiBJAjBVnEGnlrF04kV320+FUpdYBKVW+egA
 jPCDUgkB4zCW/A06Ju7bBpMInk36eKdBlwd2d1RkNpPgfx59ptOfA1o8FJnDeN2wPIGv
 1kNbXvlMwzhLZe38pcCFWxsF1RJCHiLeYggDV7L/rNYO2iFjQAJ5p39gUmgU0SAOrlul
 8Xef2fcv6lZNF3J61QQfUEvfuIH4pgkvr4Axk5Ak2NCXXkRIgkQRHcXQKtVjmDhEp7NW
 4urErfWt521Hv9I0Js7wceHPr+SDyXeW5aR20MTOI4jQ5y0scz5QsY6gWCJNvyAjKF5z
 F7zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=NkmFG1QTNaWLlvVjiv9pwliViB1M7jgJYDg2EZ3dMok=;
 b=DRrjMkgT1qLMJn+yImXEckPcTf8HZk3l+XCBSc80Tbx82Ni854JDD295P2g47uZ8eb
 8xcwnQnu695iSSxFZMAzdmMnlH31/GDlIyBw2eWs8ho7IXL7nalN1wPRDm5UugFSF81s
 kBG9xwSHaPSUcr6LbqfonFYmymj7+spXPD+iMd03Coo/b1NXb4yHp4LnLzlBQSv/9KVK
 b67Nx6qFniI5iikwT5rS80onCK4SRqZinHTiv3+lBhxc3oSf0vGlMcHnZectQ5vorSKb
 bVhYg4cBTaYEV859rXlhTX5tRQ9IILNT/uuV/YP/q44xQCvDaAQVFCY8G8eFg1XyHMYi
 1AjQ==
X-Gm-Message-State: AOAM533NYR70rSwJ4yapcNHOcl+/+JH4OMITSoAqbfKr87WoOBpoZzYg
 iUyhnqQ73et24jNAuxU1czt70Q==
X-Google-Smtp-Source: ABdhPJxprMiF0zGDn3aiZrgY4HoSDJt/e63ieUbL0NnjzPGhqKsxJMPTarGSMdBCXnNl3lnPLITsxw==
X-Received: by 2002:a4a:2a46:: with SMTP id x6mr3638863oox.85.1617212360914;
 Wed, 31 Mar 2021 10:39:20 -0700 (PDT)
Received: from MacBook-Pro.hackershack.net
 (cpe-173-173-107-246.satx.res.rr.com. [173.173.107.246])
 by smtp.gmail.com with ESMTPSA id v1sm557900ooh.3.2021.03.31.10.39.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Mar 2021 10:39:20 -0700 (PDT)
To: kalyan_t@codeaurora.org
References: <y> <1616404632-13693-1-git-send-email-kalyan_t@codeaurora.org>
 <823f7f00-444e-8e22-e8d0-2ced97e4c291@kali.org>
 <9847b4af5331f86641eb7be5a932078b@codeaurora.org>
From: Steev Klimaszewski <steev@kali.org>
Message-ID: <b98d5a32-1776-6ae1-69ec-e06bc7143695@kali.org>
Date: Wed, 31 Mar 2021 12:39:17 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <9847b4af5331f86641eb7be5a932078b@codeaurora.org>
Content-Language: en-US
Subject: Re: [Freedreno] [v1] drm/msm/disp/dpu1: icc path needs to be set
 before dpu runtime resume
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
Cc: mkrishn@codeaurora.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, hywu@google.com, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, mka@google.com,
 robdclark@gmail.com, midean@google.com, freedreno@lists.freedesktop.org,
 y@qualcomm.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Ck9uIDMvMzEvMjEgNzozNCBBTSwga2FseWFuX3RAY29kZWF1cm9yYS5vcmcgd3JvdGU6Cj4gT24g
MjAyMS0wMy0zMSAwMDowNCwgU3RlZXYgS2xpbWFzemV3c2tpIHdyb3RlOgo+PiBPbiAzLzIyLzIx
IDQ6MTcgQU0sIEthbHlhbiBUaG90YSB3cm90ZToKPj4+IEZyb206IEthbHlhbiBUaG90YSA8a2Fs
eWFudEBjb2RlYXVyb3JhLm9yZz4KPj4+Cj4+PiBEUFUgcnVudGltZSByZXN1bWUgd2lsbCByZXF1
ZXN0IGZvciBhIG1pbiB2b3RlIG9uIHRoZSBBWEkgYnVzIGFzCj4+PiBpdCBpcyBhIG5lY2Vzc2Fy
eSBzdGVwIGJlZm9yZSB0dXJuaW5nIE9OIHRoZSBBWEkgY2xvY2suCj4+Pgo+IEhpIFN0ZWV2LAo+
Cj4gVGhlIFdBUk5fT04gaXMgdHJ1ZSBvbmx5IGZvciB0aGUgZGV2aWNlIHdpdGggY29tcGF0aWJs
ZQo+ICJxY29tLHNjNzE4MC1tZHNzIi4gRm9yIG90aGVyIGRldmljZXMgaXRzIGEKPiBmYWxzZSBh
bGFybS4gQ2FuIHlvdSBwbGVhc2UgdHJ5IHdpdGggdGhlIGJlbG93IGNoYW5nZSA/Cj4KPiBodHRw
czovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtYXJtLW1zbS9wYXRjaC8xNjE3
MTkwMDIwLTc5MzEtMS1naXQtc2VuZC1lbWFpbC1rYWx5YW5fdEBjb2RlYXVyb3JhLm9yZy8KPgo+
Cj4gVGhhbmtzLAo+IEthbHlhbgo+CkhpIEthbHlhbiwKClRlc3RlZCBoZXJlLCBhbmQgaXQgZG9l
cyBnZXQgcmlkIG9mIHRoZSB3YXJuaW5nLsKgIEknbGwga2VlcCBhIGNvcHkgb2YKdGhlIHBhdGNo
IGxvY2FsbHksIHNpbmNlIHRoaXMgaXMgZ29pbmcgdG8gaGl0IHN0YWJsZSB0b28gYXQgc29tZSBw
b2ludAppdCBzZWVtcywgYXQgbGVhc3QgdW50aWwgYW5vdGhlciB2ZXJzaW9uIGNvbWVzIG91dCBh
ZGRyZXNzaW5nIHRoZSBvdGhlcgpjb21tZW50cyBmcm9tIHBlb3BsZSB3YXkgc21hcnRlciB0aGFu
IG1lLgoKLS0gc3RlZXYKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkZyZWVkcmVubyBtYWlsaW5nIGxpc3QKRnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ZyZWVk
cmVubwo=
