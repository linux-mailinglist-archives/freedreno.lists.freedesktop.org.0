Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A22FB7553F
	for <lists+freedreno@lfdr.de>; Thu, 25 Jul 2019 19:18:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 525686E7BD;
	Thu, 25 Jul 2019 17:18:51 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A22996E7BD
 for <freedreno@lists.freedesktop.org>; Thu, 25 Jul 2019 17:18:49 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id t132so23355150pgb.9
 for <freedreno@lists.freedesktop.org>; Thu, 25 Jul 2019 10:18:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:mime-version
 :content-transfer-encoding:in-reply-to:references:subject:to:cc:from
 :user-agent:date;
 bh=pKF4uTEG2V2736jXBsUmCSSZEQt/JQWcWxojg2SNHvQ=;
 b=ARhqJ9Mt+Odp73QzdpqPbPCf78yhhZ22t7X9qO7/OQTapZa/R56BbPl+5qpJbsUujq
 TOggRuHU1vyaA0t8+hQTDtv+B5TdumZLfM4SkqN4f7tIBnngi8C9JhJCMnLrH5TheHmN
 z0CXWY7b/WcR1tjmk0OLr4QMcV+uNSJ7BXGnhlTyFCkgxcKcV42oipF0fXn5CEt8s2x+
 IrGoK9f6tlqEHk3uFiqvVcZu0yGv4DYF03toGSujIOXXF/LDR9E2TD7tuLfe/uCbsHAm
 ZZiBt0oMGDGuB3IskuQLV/oNr9jywkC7a2vpMoqVH4QvRS83TgvpV94eGxmVAEWMnilf
 67lA==
X-Gm-Message-State: APjAAAXcICg2tQw0mXGycSCSbx3LBQVfER8tXVJ9GXdY9jaFtVGwJHZQ
 /HnluPRd2gLn96zQZ160dtUizA==
X-Google-Smtp-Source: APXvYqwyvvB59B3ughI+E3wp1WnBBj0Dam/Cxzjm5SQLtruxS4EDniq2hIg9r9i6o5dS5o9HEqeP6A==
X-Received: by 2002:a63:7245:: with SMTP id c5mr73569315pgn.11.1564075129171; 
 Thu, 25 Jul 2019 10:18:49 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
 by smtp.gmail.com with ESMTPSA id l31sm88237663pgm.63.2019.07.25.10.18.48
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 25 Jul 2019 10:18:48 -0700 (PDT)
Message-ID: <5d39e478.1c69fb81.53508.87c6@mx.google.com>
MIME-Version: 1.0
In-Reply-To: <1564073635-27998-1-git-send-email-jcrouse@codeaurora.org>
References: <1564073635-27998-1-git-send-email-jcrouse@codeaurora.org>
To: Jordan Crouse <jcrouse@codeaurora.org>, freedreno@lists.freedesktop.org
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.8.1
Date: Thu, 25 Jul 2019 10:18:47 -0700
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=message-id:mime-version:content-transfer-encoding:in-reply-to
 :references:subject:to:cc:from:user-agent:date;
 bh=pKF4uTEG2V2736jXBsUmCSSZEQt/JQWcWxojg2SNHvQ=;
 b=YzYCDtwsX9ubBUiVtnqndDSs3hmpOz1P0CeQ2TgcZ8Gn4gowsx2EV6xe/gDciXbo2V
 cXdMt+RL/GjOKn65B/pUAoWDBBVtRu8cL07AYgSTHhJrpiSVUcvsdrZEvC/sw2oNtyHQ
 J06ebgNs46VM6Kb3iZgbNX/a4WxRa0QpnyGOo=
Subject: Re: [Freedreno] [PATCH] drm/msm: Use generic bulk clock function
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Sharat Masetty <smasetty@codeaurora.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 Rob Clark <robdclark@gmail.com>, Mamta Shukla <mamtashukla555@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Andy Gross <andy.gross@linaro.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

UXVvdGluZyBKb3JkYW4gQ3JvdXNlICgyMDE5LTA3LTI1IDA5OjUzOjU1KQo+IFJlbW92ZSB0aGUg
aG9tZWJyZXdlZCBidWxrIGNsb2NrIGdldCBmdW5jdGlvbiBhbmQgcmVwbGFjZSBpdCB3aXRoCj4g
ZGV2bV9jbGtfYnVsa19nZXRfYWxsKCkuCj4gCj4gU2lnbmVkLW9mZi1ieTogSm9yZGFuIENyb3Vz
ZSA8amNyb3VzZUBjb2RlYXVyb3JhLm9yZz4KPiAtLS0KClJldmlld2VkLWJ5OiBTdGVwaGVuIEJv
eWQgPHN3Ym95ZEBjaHJvbWl1bS5vcmc+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpGcmVlZHJlbm8gbWFpbGluZyBsaXN0CkZyZWVkcmVub0BsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9mcmVlZHJlbm8=
