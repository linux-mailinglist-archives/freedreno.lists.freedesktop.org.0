Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 890A016EEF6
	for <lists+freedreno@lfdr.de>; Tue, 25 Feb 2020 20:28:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3726B6E8FD;
	Tue, 25 Feb 2020 19:28:02 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C63ED6EBA6
 for <freedreno@lists.freedesktop.org>; Tue, 25 Feb 2020 19:28:00 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id 6so46631pgk.0
 for <freedreno@lists.freedesktop.org>; Tue, 25 Feb 2020 11:28:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=4tK5dhNanRBX4RJaY81MXL5uMw9VPzyZ3UaipGWjTeA=;
 b=ER4Hn5y39DsTdFq4OIFR/dyYBA/md+YMiH6Vlftw5sX/8I8svVtJwDWrl+hIbHDMI+
 9DIcp5qY/z7utP3Wlsfmi7SD9FiFgaz3JqHR/5d8KjPWEgJS68eSS/70DaFi0VVUDqjx
 qsRNASKUBSfoa6zYDICVI1jWv5RUSbtgDxLeA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=4tK5dhNanRBX4RJaY81MXL5uMw9VPzyZ3UaipGWjTeA=;
 b=EYWxiXho+5gbkS3mcu9J6nOa3BE8ynbZ+nkWkVFMNSXVA2ecuPiTQlrEEOKlJbST4a
 HnmTd8OOfK+MnjexNBdiT7aZCiWWoU2kjqMaAC6+9AwT54E17hTIYeFvI53qEXhXnwd+
 hIu0YF1ixfAuSCMpKYU0MJFJz8UhdJdjeUw9/u8uyZ7R3HD2Yx1OoFTUX5gAFW+BMMav
 rbHpDuF4MZ2KPiosjXTcDCh9Wbz7bBrH7E6NAAf6VN1N6OlgO4jwKeWQh4V30i/8xC9M
 OKyI3VlDIiCfDufaR2mk8POIDZy3VJh3PTWeQ6mZ1NNpMNwnCfcqRQvVm4a+c+vxoi7q
 iykA==
X-Gm-Message-State: APjAAAVC1oL6E45TzYPsx+bq7H6tYsRQHCFHPsLArnfJfJtz3Z7gYkEi
 7SD5csnYxYSMI/s2VmHvvyl3oA==
X-Google-Smtp-Source: APXvYqx/CuR9tWXGTo9ivBHMqDj/j7Gy5ChN3CDCAyQZMV9kpz8TazoKp8muVVv6CLf1YgtUt+g7UA==
X-Received: by 2002:aa7:9808:: with SMTP id e8mr299103pfl.32.1582658880299;
 Tue, 25 Feb 2020 11:28:00 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
 by smtp.gmail.com with ESMTPSA id c26sm18406262pfj.8.2020.02.25.11.27.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2020 11:27:59 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20200219104148.1.I0183a464f2788d41e6902f3535941f69c594b4c1@changeid>
References: <20200219104148.1.I0183a464f2788d41e6902f3535941f69c594b4c1@changeid>
From: Stephen Boyd <swboyd@chromium.org>
To: Drew Davenport <ddavenport@chromium.org>, dri-devel@lists.freedesktop.org
Date: Tue, 25 Feb 2020 11:27:58 -0800
Message-ID: <158265887882.177367.3011043098001339741@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Subject: Re: [Freedreno] [PATCH 1/4] drm/msm/dpu: Remove unused function
 arguments
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Alexios Zavras <alexios.zavras@intel.com>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 Drew Davenport <ddavenport@chromium.org>, Thomas Gleixner <tglx@linutronix.de>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Drew Davenport (2020-02-19 09:42:24)
> Several functions arguments in the resource manager are unused, so
> remove them.
> 
> Signed-off-by: Drew Davenport <ddavenport@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

> 
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 37 ++++++++++----------------
>  1 file changed, 14 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> index 23f5b1433b357..dea1dba441fe7 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> @@ -144,8 +144,7 @@ static int _dpu_rm_hw_blk_create(
>                 const struct dpu_mdss_cfg *cat,
>                 void __iomem *mmio,
>                 enum dpu_hw_blk_type type,
> -               uint32_t id,
> -               const void *hw_catalog_info)
> +               uint32_t id)

It would be good to use u32 instead of uint32_t in this code too. The
kernel style is to use the shorter name for that type.
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
