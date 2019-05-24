Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD33C2A007
	for <lists+freedreno@lfdr.de>; Fri, 24 May 2019 22:43:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A8676E0E5;
	Fri, 24 May 2019 20:43:39 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D24C16E0E5
 for <freedreno@lists.freedesktop.org>; Fri, 24 May 2019 20:43:37 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id g9so4596438plm.6
 for <freedreno@lists.freedesktop.org>; Fri, 24 May 2019 13:43:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:mime-version
 :content-transfer-encoding:in-reply-to:references:subject:from:cc:to
 :user-agent:date;
 bh=XYlEJGhmV+ZH77RNipzHzZLCyxSeSQNCKabAuaHQX5g=;
 b=ajQpW4QNb8ujZXvcnis/sh8KubfzK2u5dq1sqLp5f7Irbx3EVab63lOVp2jbb7BWpD
 u4lwYH/fwRtSa4UfMT9+3dHKoZV9ni0w/jZsnDMHGYIuxljYi4XlakBRgPmKE9eAMmp7
 o95kffXCWMAN8pOMTY08uCky5l3RZXmCnC52QUuUNztpAvpNLuFedtoZwC5C+4WPxJE+
 J1vR0yuj6SSZeinK6z1uT2SR0jEhcAJvFZX2/LK4+HP9WD7CbP3HnVvm0GF/3cPCf6qC
 TNd2Y909SkZBPgK7jExWDuC6kh9i2T2bKQcHb+hrtNWTVV2Bz/XyxNxNxwuhqfN1/ZK+
 Ecmw==
X-Gm-Message-State: APjAAAX+ZOrGqVVR5GK90Qp31B6sfiadLpwlN7+gUzXW/n0GPKBQ9NtA
 cJX77KyCEg5qleDE7f3wsCAeNg==
X-Google-Smtp-Source: APXvYqy4bHdJtzpQke5FGpvQIwzY9VRQtG1nbSuaGtiQQwPTga0LpVbsbq2N7mJ7wkglH8TDxg5eyw==
X-Received: by 2002:a17:902:d24:: with SMTP id
 33mr108743947plu.148.1558730617412; 
 Fri, 24 May 2019 13:43:37 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
 by smtp.gmail.com with ESMTPSA id q19sm4403146pff.96.2019.05.24.13.43.36
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 24 May 2019 13:43:36 -0700 (PDT)
Message-ID: <5ce85778.1c69fb81.ccfd3.bac8@mx.google.com>
MIME-Version: 1.0
In-Reply-To: <20190524173231.5040-1-sean@poorly.run>
References: <20190524173231.5040-1-sean@poorly.run>
From: Stephen Boyd <swboyd@chromium.org>
To: Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
User-Agent: alot/0.8.1
Date: Fri, 24 May 2019 13:43:35 -0700
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=message-id:mime-version:content-transfer-encoding:in-reply-to
 :references:subject:from:cc:to:user-agent:date;
 bh=XYlEJGhmV+ZH77RNipzHzZLCyxSeSQNCKabAuaHQX5g=;
 b=ZysEZ+lzbs4WdfNLSfgn4Jd5YoDfaKAShEaz4jGm4KKJb96DCqWPU+PihMo2zf9s0A
 VvLLbECme3tWN4KsnLA27AHO5WQQbOt+ACDR9xmiSu9lZPb0fMoO7Ev+wZBJcvjdphMs
 N6tr3emJekd2/Qf84t+1l53//jQmatrbfIoHE=
Subject: Re: [Freedreno] [PATCH 1/2] drm/msm/dpu: Use provided drm_minor to
 initialize debugfs
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
Cc: Sean Paul <sean@poorly.run>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <seanpaul@chromium.org>, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

UXVvdGluZyBTZWFuIFBhdWwgKDIwMTktMDUtMjQgMTA6MzI6MTgpCj4gRnJvbTogU2VhbiBQYXVs
IDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+Cj4gCj4gSW5zdGVhZCBvZiByZWFjaGluZyBpbnRvIGRl
di0+cHJpbWFyeSBmb3IgZGVidWdmc19yb290LCB1c2UgdGhlIG1pbm9yCj4gcGFzc2VkIGludG8g
ZGVidWdmc19pbml0Lgo+IAo+IFRoaXMgYXZvaWRzIGNyZWF0aW5nIHRoZSBkZWJ1ZyBkaXJlY3Rv
cnkgdW5kZXIgL3N5cy9rZXJuZWwvZGVidWcvIGFuZAo+IGluc3RlYWQgY3JlYXRlcyB0aGUgZGly
ZWN0b3J5IHVuZGVyIHRoZSBjb3JyZWN0IG5vZGUgaW4KPiAvc3lzL2tlcm5lbC9kZWJ1Zy9kcmkv
PG5vZGU+LwoKU28gZG9lcyB0aGlzIG1ha2UgaXQgYmVjb21lIC9zeXMva2VybmVsL2RlYnVnL2Ry
aS88bm9kZT4vZGVidWc/CgpJIHdvbmRlciB3aHkgaXQgY2FuJ3QgYWxsIGJlIGNyZWF0ZWQgdW5k
ZXIgL3N5cy9rZXJuZWwvZGVidWcvZHJpLzxub2RlPgphbmQgdGhlbiBhdm9pZCB0aGUgZXh0cmEg
ImRlYnVnIiBkaXJlY3RvcnkgdGhhdCBpc24ndCBhZGRpbmcgYW55IHZhbHVlPwoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KRnJlZWRyZW5vIG1haWxpbmcg
bGlzdApGcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZnJlZWRyZW5v
