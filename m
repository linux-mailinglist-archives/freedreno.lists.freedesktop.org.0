Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC75F2A75EA
	for <lists+freedreno@lfdr.de>; Thu,  5 Nov 2020 04:06:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F4D26E0D7;
	Thu,  5 Nov 2020 03:06:52 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F2906E0D7
 for <freedreno@lists.freedesktop.org>; Thu,  5 Nov 2020 03:06:51 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id t14so277493pgg.1
 for <freedreno@lists.freedesktop.org>; Wed, 04 Nov 2020 19:06:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=fqzol1toKOJ2RVn1yfN+uFz+FMegwGU92eH/lUKJAVI=;
 b=A4fecVXEo5PihTIYzuZE0apzH31nKR2CH7ATTvax9pzG9s/4Shxgk71uTzHvyDo8WA
 S+5F/z7RlKDa2+lOcjmZpNLEPrZJM3eQr60GhqkDvK9OCRFIDqgmajqaYqdR7+FhIGP6
 x/MAWl41JRq5uPLqQJkrbM/RP9//84d1E6n9I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=fqzol1toKOJ2RVn1yfN+uFz+FMegwGU92eH/lUKJAVI=;
 b=am6VeAbfG5iTXWSVZJEMYckH4uwo4iYh4S2rzKuTkiuaGbu9HKs0OYZFzIxraA3v57
 u7iuH2kUNGESZmhhxpN6X+h1iahOoVGVYMH3/JFdREyen0D1qWli4Z6s9qVH8lflyZZq
 DzPfdJG0SbAnGtlmV3lVBtt5T8rMgotSHo5YUd5DlDn1S16FPvb8azUaWXDyKxjHg4xu
 arndNaob1+LULBcFORmEh66nAi1pnvgkk2FeFzNWG+xKXbQnH6qd+SSiHJeL3eBdiMuq
 9H+uFt5fMUlXN3RD/gc6nSjf90MQnie5LyXY4dTDp/G39AHh3DNGQmuGaOnuUZgD/rxU
 Nxmg==
X-Gm-Message-State: AOAM5311F5SeGXH7rrDgEaI3VEUBpszFRHO9knuOmMVVWjNlFmmgYrXR
 7/D8tr/FFYRg0DieJfbgGRydfQ==
X-Google-Smtp-Source: ABdhPJwQqkKr0xcU/WoDFy1ySt/MLLEIAzvNmTX1lPIJkg74SuC9KzLPe0bDYookJJkiZfjHjZKOWw==
X-Received: by 2002:a62:790f:0:b029:18a:ae57:353f with SMTP id
 u15-20020a62790f0000b029018aae57353fmr369277pfc.78.1604545611022; 
 Wed, 04 Nov 2020 19:06:51 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
 by smtp.gmail.com with ESMTPSA id t32sm239063pgl.0.2020.11.04.19.06.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 19:06:50 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20201103204902.11899-4-khsieh@codeaurora.org>
References: <20201103204902.11899-1-khsieh@codeaurora.org>
 <20201103204902.11899-4-khsieh@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
To: Kuogee Hsieh <khsieh@codeaurora.org>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run
Date: Wed, 04 Nov 2020 19:06:47 -0800
Message-ID: <160454560709.3965362.13891080172465271158@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Subject: Re: [Freedreno] [PATCH 3/3] drm/msm/dp: promote irq_hpd handle to
 handle link training correctly
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
Cc: airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, abhinavk@codeaurora.org,
 Kuogee Hsieh <khsieh@codeaurora.org>, tanmay@codeaurora.org, daniel@ffwll.ch,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2020-11-03 12:49:02)
> Some dongles require link training done at irq_hpd request instead
> of plugin request. This patch promote irq_hpd handler to handle link
> training and setup hpd_state correctly.
> 
>  Fixes: fdaf9a5e3c15 (drm/msm/dp: fixes wrong connection state caused by failure of link training)

This fixes tag has a space before it incorrectly. Also, it should have
quotes.

Fixes: fdaf9a5e3c15 ("drm/msm/dp: fixes wrong connection state caused by failure of link training")

> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
