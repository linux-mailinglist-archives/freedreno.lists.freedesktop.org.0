Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8822E5B519C
	for <lists+freedreno@lfdr.de>; Mon, 12 Sep 2022 00:51:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 188D310E349;
	Sun, 11 Sep 2022 22:51:29 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDDA310E349
 for <freedreno@lists.freedesktop.org>; Sun, 11 Sep 2022 22:51:25 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 t8-20020a9d5908000000b0063b41908168so4753829oth.8
 for <freedreno@lists.freedesktop.org>; Sun, 11 Sep 2022 15:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date;
 bh=yf6us0hpX9C+LQcsMl8TWkCbnYmsi9yU4+2aJofZWvw=;
 b=f/VeRCwZVsc2aBLVrdb5X6p45wFZ7LLVVBaei228qrJLXXEfigzM9sj4Gshg4vg1bb
 5rNUz6HxDgfuF0du+GtbgGRgi/3vOC+xwV8qIJ6IFIc4mP0McTqVEKs7vTBsaPKwUDvo
 XOFaF32qNe1Daqp7zvrTEG8FfH3ZBJmc0lkKM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=yf6us0hpX9C+LQcsMl8TWkCbnYmsi9yU4+2aJofZWvw=;
 b=twoUnHsSbCzCNpbK/SmaI/7ptMigrWc47s9ksWnBFWXBYNP90h5Y719X3LO7AiQh9d
 Z3/r6r82qO7ue8lYGPWmpyf7zGK2G3i1bcrHjZE8zGXBCBenTL1xUlc5iXRJ9QAAGmaM
 WtzOfcCxDTe4MJpHlKAfJMl4cEcE5CFedKSx8AUD6bU86jQ82Frjw9FL/haAevL/OKeC
 RBQDErXLC4QHmFa73OekAIfp5KacVjJ1ObJJzmOutkG+zWeYk+FnB8nd9FmhasFGFl8m
 pfV4YI/hAKktNN+QUIQPBwpqvo4HkXBI2mW1hV3v+qaIsWV9/OoM4MPmbVU5MtpP0m/2
 b4Mw==
X-Gm-Message-State: ACgBeo2r/1vaeg0/nhJK2wga4stXoa29XOrQTs/KLrY4sPo+ZS7YmLHG
 eSvdyR+op5SyMYMhlRLxzXZvN4W6ABoh1KbOZaIgyQ==
X-Google-Smtp-Source: AA6agR5dthMo/JycUE/0eQ7pE2kMS3cJLcSQDOaW/Qur0qtlVKXNbZbZ3G7tq0yONaPO7sO0TX9z8zeHVfIBJtcrz2w=
X-Received: by 2002:a9d:738c:0:b0:638:9962:8cb6 with SMTP id
 j12-20020a9d738c000000b0063899628cb6mr9426218otk.73.1662936684828; Sun, 11
 Sep 2022 15:51:24 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 11 Sep 2022 17:51:24 -0500
MIME-Version: 1.0
In-Reply-To: <1662621988-6873-1-git-send-email-quic_kalyant@quicinc.com>
References: <y> <1662621988-6873-1-git-send-email-quic_kalyant@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Sun, 11 Sep 2022 17:51:24 -0500
Message-ID: <CAE-0n51x3um=CZFk0K0k=7XkgbUk7OixtTjr2oqkhOLOz7yzwg@mail.gmail.com>
To: Kalyan Thota <quic_kalyant@quicinc.com>, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, y@qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [v4] drm/msm/disp/dpu1: add support for dspp sub
 block flush in sc7280
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
Cc: dianders@chromium.org, quic_abhinavk@quicinc.com,
 linux-kernel@vger.kernel.org, quic_vpolimer@quicinc.com, robdclark@gmail.com,
 dmitry.baryshkov@linaro.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Kalyan Thota (2022-09-08 00:26:28)
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> index a35ecb6..bbda09a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> @@ -307,6 +309,31 @@ static void dpu_hw_ctl_update_pending_flush_dspp(struct dpu_hw_ctl *ctx,
>         }
>  }
>
> +static void dpu_hw_ctl_update_pending_flush_dspp_subblocks(
> +       struct dpu_hw_ctl *ctx, enum dpu_dspp dspp, u32 dspp_sub_blk)
> +{
> +       uint32_t flushbits = 0, active;

Please use u32 in the kernel. It's shorter.
