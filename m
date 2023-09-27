Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 948CA7B0E6C
	for <lists+freedreno@lfdr.de>; Wed, 27 Sep 2023 23:59:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5618E10E5C2;
	Wed, 27 Sep 2023 21:59:09 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com
 [IPv6:2607:f8b0:4864:20::1136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4202010E5C2
 for <freedreno@lists.freedesktop.org>; Wed, 27 Sep 2023 21:59:07 +0000 (UTC)
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-59bc956b029so149419677b3.2
 for <freedreno@lists.freedesktop.org>; Wed, 27 Sep 2023 14:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695851946; x=1696456746; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=DP5Uedv/1yMifXzUXQtfbnX1+oqNSxP4nw/UIu79iho=;
 b=U97cwLq0iPT+FCYGcw+dyMt98NMA41fPzVTXKoIRs+Ligzd+1pYeTGc8jTZlnhVCuB
 NdPqjLG4jXuwTOMaEVYXLjkS7O+LwMn8QFvlDBV1AQWXm2ck4XJufAZZk5A24WjM4XaH
 6AzYQj0PmpW8LqPFG7VL4L4hSDizRFjJtFszbCwOq2hpNhh/N6CmuGgxGnt5LHbKavch
 GJV2J3yn6U928cQYjQ0me53bZEgTKRVhKDdWt+a0c/Zv/3aLDqoxj36vP7KAszoifewY
 pvLHrc5f7aI4jBnhup5iyNZUVarefMrkQ8o1OCAQOIYO+TqiunfS4TAWeNnnfc+wl5Xm
 Zfdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695851946; x=1696456746;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DP5Uedv/1yMifXzUXQtfbnX1+oqNSxP4nw/UIu79iho=;
 b=bAoBAtVxGo0bQ3dvuin03+gO+zlV/pfpJJP7uOHejoMOuV77zA5mFKmTPCna462qdn
 stppXkXxfJTXXlNDzk4wQkbtICCVOtfAYSG6YvMtHuLsXqn+Je1RfRvG7aAehvrocvpA
 5ZyKSuPi5uOyDS38sF49C9Onb6PHkAZGk0kV1G6dT6Q7jAVCV8xdodcMY3MmtrCFAhPZ
 hYDchzDcRRP/BYjMcqi/MTdziSWW3o2SdCW1vzc2WI3aGG+GBkiuWUONevkRkuvA3TaH
 uY8aIw0wI5bP2Pl0oJ+IIMC8uO/jU3C1YTBUE9TDFVYexFeqMFfBpmYWzffOjPjQ1AjM
 9Eog==
X-Gm-Message-State: AOJu0YwWho41adHfFlwVNBCV1jgS3eNlpN8pT/98x+ieaWj3ohNRNxdM
 8w0Ga4UwAvtqjYsnPccpuUPcv31kFC1ACHcFv/4fEw==
X-Google-Smtp-Source: AGHT+IEIPMz2mp77iJ0Nj6OqjXkVaki4IzZoJvu5cV4d4PW/83jvmVYIXbRBF6dGGZ7oHh4r/FAPeIcabpPINR2axek=
X-Received: by 2002:a0d:fd45:0:b0:59b:524a:7238 with SMTP id
 n66-20020a0dfd45000000b0059b524a7238mr3050722ywf.26.1695851946328; Wed, 27
 Sep 2023 14:59:06 -0700 (PDT)
MIME-Version: 1.0
References: <1695848028-18023-1-git-send-email-quic_khsieh@quicinc.com>
 <CAA8EJpodnwS7nLupewLJfmGw6HhVSpFj=EGxSp4gKXDwtLw2QA@mail.gmail.com>
 <47a814da-3e02-2c01-eb43-ef08478ae983@quicinc.com>
In-Reply-To: <47a814da-3e02-2c01-eb43-ef08478ae983@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 28 Sep 2023 00:57:56 +0300
Message-ID: <CAA8EJpr29FDEYBshA3Yk6naUHMXuHFq9vi4PRZKc74wre_Bz=Q@mail.gmail.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v4 0/8] incorporate pm runtime framework and
 eDP clean up
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
Cc: freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, 28 Sept 2023 at 00:44, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> sorry,
>
> just found that my email filter setting has problem which always store cover letter patch to different folder than other patches.
>
> In addition, it looks like patchwork doesn't track comments in the cover letter.
>
> This cause I missed you comments.
>
> I will address your comments at next patch.

thanks

>
> Thanks,
>
>
>
> On 9/27/2023 2:10 PM, Dmitry Baryshkov wrote:
>
> On Wed, 27 Sept 2023 at 23:54, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> Incorporate pm runtime framework into DP driver and clean up eDP
> by moving of_dp_aux_populate_bus() to probe().
>
> Dear Kuogee. Let me quote my response to v1 of your series:
>
> Please use sensible prefix for cover letters too. It helps people
> understand, which driver/area is touched by the patchset.
>
> This is v4 already and the cover letter still has the same subject line.
> If you are ignoring the review comments, should I start ignoring your patches?
>
> Kuogee Hsieh (8):
>   drm/msm/dp: tie dp_display_irq_handler() with dp driver
>   drm/msm/dp: rename is_connected with link_ready
>   drm/msm/dp: use drm_bridge_hpd_notify() to report HPD status changes
>   drm/msm/dp: move parser->parse() and dp_power_client_init() to probe
>   drm/msm/dp: incorporate pm_runtime framework into DP driver
>   drm/msm/dp: delete EV_HPD_INIT_SETUP
>   drm/msm/dp: add pm_runtime_force_suspend()/resume()
>   drm/msm/dp: move of_dp_aux_populate_bus() to eDP probe()
>
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c |   4 -
>  drivers/gpu/drm/msm/dp/dp_aux.c         |  40 +++-
>  drivers/gpu/drm/msm/dp/dp_display.c     | 341 +++++++++++---------------------
>  drivers/gpu/drm/msm/dp/dp_display.h     |   3 +-
>  drivers/gpu/drm/msm/dp/dp_drm.c         |  14 +-
>  drivers/gpu/drm/msm/dp/dp_power.c       |  16 --
>  drivers/gpu/drm/msm/dp/dp_power.h       |  11 --
>  drivers/gpu/drm/msm/msm_drv.h           |   5 -
>  8 files changed, 161 insertions(+), 273 deletions(-)
>
> --
> 2.7.4
>
>


-- 
With best wishes
Dmitry
