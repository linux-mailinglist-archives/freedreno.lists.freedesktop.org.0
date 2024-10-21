Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8A19A67DC
	for <lists+freedreno@lfdr.de>; Mon, 21 Oct 2024 14:18:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1892F10E4A6;
	Mon, 21 Oct 2024 12:17:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="cVImfNE5";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB86510E4C2
 for <freedreno@lists.freedesktop.org>; Mon, 21 Oct 2024 12:17:57 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-539f4d8ef84so4455999e87.0
 for <freedreno@lists.freedesktop.org>; Mon, 21 Oct 2024 05:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729513076; x=1730117876; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=prphtPU0Rb62bRXSWJ4X3+5cxLNBcE3V+GKAi8EyFnY=;
 b=cVImfNE5wSiivYAu4EqYw1I7hzsGqgdZxXgayrq/N+u4kXgPzPwF04QTdBPvy7rvqI
 qDB+xVWaRWnOkkSc6QEd7jJmxYzOT3eDiFU+/F5G36CZTaCxifH/k2G0BqOGyEduMNZt
 Xd6LSx1AciCf0vU+NKQ1QAKAPFmIDUrFKTPDNrgy4fl1vtKTbP7KQ2e9OyfSpeJf6oPF
 Cx5cnBJTjBcFP/a714k2hmwRiQmCi6smauYNgWRmQryq4dre6gGFBeN8mjo4lyV4LhNj
 TTrboNdufFsnsQFNcULymjCblXIbmUiHsGfQloD1VjWv8LhYSGSwf98UceLWmuZIHztM
 opzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729513076; x=1730117876;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=prphtPU0Rb62bRXSWJ4X3+5cxLNBcE3V+GKAi8EyFnY=;
 b=OAVI4IHZunHtWU0OozESBQRM5RfPS2Bmv132oOAgacE58Vtb2nSH4mO2Wd/1zOLZ44
 mWLSYHXebp613TEC99elb9D/ty2vmbtEATcFZIQrVpw6+C8akIM6vFVm+3HEU35AUtt8
 Tzgl6lSFdfvAx6fg70wQUQQeakC9YnfPANqMFsKcHoyQtKwjvpZgBi4TofWv6cCl+FNC
 WGoXz5R3uiPA550Kst7Qrdh5pZc6fu3hcVBMmsGIPknMEU07EneV7YyNhEbUin/e4Hxr
 iP0mhh3SxgoVzO2hK6FzxEuwOq0DWMQuwZ2IoriFbw7nP0j9TiEWlUzdnzazkGjWCAk3
 ynKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUltLP7sC2XL0rYryJMY/x5FIAYHYcwX2LNARKyVUubqAE6KWH9B0mjU0ZFUtuAeFVX9T7pvxUDQ4o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxAIlmcTsaP4C7CVIWm28yJ7GGUli7dVU8zxwvznqoGCjWTB5nb
 xmrw5j1Rc29HsZsnSBALE+HGjsOKxwwoGRnBKXxyiasmkDPJMw5xdU2srppLMiPB6AhbBfd1pMN
 O3s4=
X-Google-Smtp-Source: AGHT+IFNrDA2mdhvvKnYVCFjWkWFdc+2kOvP18TFsD7M+Ufianm1YsNMhkTyVIEclzmrFo67RWAnAQ==
X-Received: by 2002:a05:6512:3a8d:b0:539:f1e3:ca5e with SMTP id
 2adb3069b0e04-53a154fa75fmr5584953e87.44.1729513075791; 
 Mon, 21 Oct 2024 05:17:55 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.90])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53a22431454sm464210e87.212.2024.10.21.05.17.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2024 05:17:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: quic_abhinavk@quicinc.com, robdclark@gmail.com, airlied@gmail.com,
 Yang Li <yang.lee@linux.alibaba.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Abaci Robot <abaci@linux.alibaba.com>
Subject: Re: [PATCH -next v2] drm/msm: Remove unneeded semicolon
Date: Mon, 21 Oct 2024 15:17:44 +0300
Message-Id: <172950935861.2053501.17039063548411571436.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240918023357.59399-1-yang.lee@linux.alibaba.com>
References: <20240918023357.59399-1-yang.lee@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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


On Wed, 18 Sep 2024 10:33:57 +0800, Yang Li wrote:
> ./drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c:282:2-3: Unneeded semicolon
> 
> This patch removes an unneeded semicolon after a switch statement in the
> pll_get_post_div function. Adding a semicolon after a switch statement is
> unnecessary and can lead to confusion in the code structure.
> 
> 
> [...]

Applied, thanks!

[1/1] drm/msm: Remove unneeded semicolon
      https://gitlab.freedesktop.org/lumag/msm/-/commit/00adf52efec3

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
