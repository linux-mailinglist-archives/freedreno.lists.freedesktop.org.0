Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 591373E855F
	for <lists+freedreno@lfdr.de>; Tue, 10 Aug 2021 23:34:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF72589C0A;
	Tue, 10 Aug 2021 21:34:22 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3674389C6C
 for <freedreno@lists.freedesktop.org>; Tue, 10 Aug 2021 21:34:22 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id be20so1220947oib.8
 for <freedreno@lists.freedesktop.org>; Tue, 10 Aug 2021 14:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=bgpLmyHy//Rdaa2myVwlWVrvOLDfl36DscQjlx6Wvgo=;
 b=MzbxM7E5cFVw9K4JPRmW3EY6dt63hd511MvQfWIKO6m0qOos2mondDT1SaUGSMj7ht
 NcSJ+5X8jXuH9wVdMuQY72+kavtSYJu/hU+yxJfKkFWYi+IdZurvSzVj4LS7P834rcth
 5ly72EwOKQ2hAwWD/V6PLKThnQNH1Lowt9EsE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=bgpLmyHy//Rdaa2myVwlWVrvOLDfl36DscQjlx6Wvgo=;
 b=gLbk08aJr5VCsIiWx7hNOrWvb4geqLSGV8+7Oo+vhmWG9kTIgLV4FCZzjF4F39zwdX
 THWKIKBXbf7XImyL7NdKJqkthYKp/kBfTLusvBd7UmhfyJtbmS0+W7OnDBJNOl5T10mK
 p4+4fxd69ceGcVwuU2rSDg7dX6ciicPcXemCSDNj/hK+h2sOtzzjcC1BVy8BiaHIkKAF
 i11QKJmrXTGVZZfw9dqRtb4Vc7OPH9xfK71XZ5mR4GrbDZvmn9TUjcfV3ysHvcpABWVv
 lNSGbZswQJYKWJetSZwPCFctIrbDiltnjBygC0Axt0ke0fkPu+5S5hwDrhLN1msTv1hD
 09Uw==
X-Gm-Message-State: AOAM532uGiTb8iI2sA1soldvWti7vOKhU65W2T5JuOXxAdQootvro7qT
 QkdCYGHXPsYRRZfRmmk4Q6pYvoNrWJ2NsxQ9ov+ZIw==
X-Google-Smtp-Source: ABdhPJwtDSdSAO44q6BeLqlIjD2XgZBA9t3YQSpodb5FKKDjqUdo86V5/S+6qFY8mQ16RmOc1Rkfqd+TR4TcPze1UjY=
X-Received: by 2002:a05:6808:114a:: with SMTP id
 u10mr7816788oiu.19.1628631261456; 
 Tue, 10 Aug 2021 14:34:21 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 10 Aug 2021 14:34:21 -0700
MIME-Version: 1.0
In-Reply-To: <1628196295-7382-6-git-send-email-khsieh@codeaurora.org>
References: <1628196295-7382-1-git-send-email-khsieh@codeaurora.org>
 <1628196295-7382-6-git-send-email-khsieh@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Tue, 10 Aug 2021 14:34:20 -0700
Message-ID: <CAE-0n525MQTy8rFF1JDZTqDfGpWZoUTFkqA7Svk1CRkuDmioiw@mail.gmail.com>
To: Kuogee Hsieh <khsieh@codeaurora.org>, dri-devel@lists.freedesktop.org, 
 robdclark@gmail.com, sean@poorly.run
Cc: abhinavk@codeaurora.org, aravindh@codeaurora.org, airlied@linux.ie, 
 daniel@ffwll.ch, bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v3 5/6] drm/msm/dp: return correct edid
 checksum after corrupted edid checksum read
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

Quoting Kuogee Hsieh (2021-08-05 13:44:54)
> Response with correct edid checksum saved at connector after corrupted edid
> checksum read. This fixes Link Layer CTS cases 4.2.2.3, 4.2.2.6.
>
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
