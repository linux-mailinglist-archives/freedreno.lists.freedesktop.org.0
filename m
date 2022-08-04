Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E24589D58
	for <lists+freedreno@lfdr.de>; Thu,  4 Aug 2022 16:19:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7160E14A2C8;
	Thu,  4 Aug 2022 14:17:37 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2A9999DDB
 for <freedreno@lists.freedesktop.org>; Thu,  4 Aug 2022 14:17:22 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id o22so10070430edc.10
 for <freedreno@lists.freedesktop.org>; Thu, 04 Aug 2022 07:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=V3jLsfHepCtzmM3jqaIFNUTw4oeeGqLPVBJGqzP2VdM=;
 b=JkX7XwsJCHIlFiF0B5fxtl8ET99tlQYq3RS+0DqL8n+QyFBMY+jCN8PnuswadccSA5
 v0MdTihTLtD8ubvNIhYjEY+sngNIR8YxPzP/ayFfUmaggZkgLAMOBQ4VFkROAMr386p0
 BLiUb6KVyGjjtpbltPlz+BraNZwXSKA3psbVY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=V3jLsfHepCtzmM3jqaIFNUTw4oeeGqLPVBJGqzP2VdM=;
 b=YpxtvJVRi3EthHh5mH+GoZuwrE0UF18pz7YWpN4uAdSgnzU2Ghx7glwLxSIrcSkCCy
 rq+YmSklhFyDuKfkFEe4Tm3612TYalc5fB4bImO5jqgDOENctN/6iT+zVnA+INlID7JU
 /YCkHkgMeXlaAVWsBGW92bso813EUI/9dUuvhjxJke+C7MSdFUuIFBa5CPtEU77GYYB8
 n9ha3WhliC4VLQ4Zyh3VIv4+lKvPpL8lknj55rn3PFPyd9p3JnaUynJG9tiFbBGe8fUr
 piqj/X0t76PxZoYk4J02CDbFupZZmYekaaTu3a2znZxTa1JUEuhclZfGz5fPUeJMuYb2
 r+sA==
X-Gm-Message-State: ACgBeo1lCFr/txS1r3qgr6QkWJWOZcLvhyyF8LuX67SKMmJbrlCg5oHZ
 JCGBdfUX4mS1/SBCCuD5FQV/bJKgfo9gaYZJ
X-Google-Smtp-Source: AA6agR5m02nhWS5WiTIqnA4h1aaxwzUCggptSzvqd7ShEcNAB6OqnS46DyTryRb/wyIU0D2IWwm8qA==
X-Received: by 2002:a05:6402:51d1:b0:43e:f2d2:fa25 with SMTP id
 r17-20020a05640251d100b0043ef2d2fa25mr766279edd.31.1659622641239; 
 Thu, 04 Aug 2022 07:17:21 -0700 (PDT)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com.
 [209.85.221.43]) by smtp.gmail.com with ESMTPSA id
 sd5-20020a170906ce2500b007081282cbd8sm387656ejb.76.2022.08.04.07.17.11
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Aug 2022 07:17:13 -0700 (PDT)
Received: by mail-wr1-f43.google.com with SMTP id q30so21018228wra.11
 for <freedreno@lists.freedesktop.org>; Thu, 04 Aug 2022 07:17:11 -0700 (PDT)
X-Received: by 2002:a5d:5889:0:b0:21d:bccd:38e3 with SMTP id
 n9-20020a5d5889000000b0021dbccd38e3mr1554422wrf.659.1659622631172; Thu, 04
 Aug 2022 07:17:11 -0700 (PDT)
MIME-Version: 1.0
References: <1659608930-4370-1-git-send-email-quic_kalyant@quicinc.com>
In-Reply-To: <1659608930-4370-1-git-send-email-quic_kalyant@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 4 Aug 2022 07:16:57 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vo8GMLi=QfV=HXyVf=PTsOkntrc+OTsnQ5jMWYxSDFuQ@mail.gmail.com>
Message-ID: <CAD=FV=Vo8GMLi=QfV=HXyVf=PTsOkntrc+OTsnQ5jMWYxSDFuQ@mail.gmail.com>
To: Kalyan Thota <quic_kalyant@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [v1] drm/msm/disp/dpu1: add support for
 hierarchical flush for dspp in sc7280
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Vinod Polimera <quic_vpolimer@quicinc.com>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, Aug 4, 2022 at 3:29 AM Kalyan Thota <quic_kalyant@quicinc.com> wrote:
>
> +static void dpu_hw_ctl_set_dspp_hierarchical_flush(struct dpu_hw_ctl *ctx,
> +       enum dpu_dspp dspp, enum dpu_dspp_sub_blk dspp_sub_blk)
> +{
> +       uint32_t flushbits = 0, active = 0;

nit: don't init to 0 since you just override below.


> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> index ac15444..8ecab91 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> @@ -160,6 +160,9 @@ struct dpu_hw_ctl_ops {
>         uint32_t (*get_bitmask_dspp)(struct dpu_hw_ctl *ctx,
>                 enum dpu_dspp blk);
>
> +       void (*set_dspp_hierarchical_flush)(struct dpu_hw_ctl *ctx,
> +               enum dpu_dspp blk, enum dpu_dspp_sub_blk dspp_sub_blk);
> +

Given that most of the items in this list have kernel-doc comments
explaining them, probably you should have one for your new one too.

-Doug
