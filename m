Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC86579460B
	for <lists+freedreno@lfdr.de>; Thu,  7 Sep 2023 00:16:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8634B10E061;
	Wed,  6 Sep 2023 22:16:27 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6811810E061
 for <freedreno@lists.freedesktop.org>; Wed,  6 Sep 2023 22:16:25 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id
 46e09a7af769-6bd04558784so241601a34.3
 for <freedreno@lists.freedesktop.org>; Wed, 06 Sep 2023 15:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694038584; x=1694643384; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=TatTKafKUsYYCFxlPaO0ndc5iUmy3Qk4+A6ix/aUAqg=;
 b=FkfGFd+3Z8k7PSFSw9ew5bJxs7wu4Gwvukm4q/RTuRZqwnOAPLaSTN1E9pJGb33y4p
 +8xkNGTRLYKu1Gj8H5KF2fMjRYWOlfyK8qwk3CXDfZ+Jc39hOWtsITQ9jihOdIzRx6KZ
 MjhDWkjIYF6+EX430p7KiydsKFR5Zcf/2C3CSS61yiZ/1y6ytMvD153vqfsIBn1OVrlK
 Slqf4NuK+au/w34X/Hh7fPcxOTLZWA0XD0800jrJ1m2rX+Zx07egHDQvscfkTY2lsbM1
 2iXBHFw6AHuzZ1zHIjCX9cAOc1K8GhE8vPwCpyqw7/hnnYHktbWWnV+NZxpyLSOyzVEE
 F2dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694038584; x=1694643384;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TatTKafKUsYYCFxlPaO0ndc5iUmy3Qk4+A6ix/aUAqg=;
 b=IV2RPJZPZogrVcVmkx2rZgMFVvl41ZSNZ5z2gT/feuTAH+11VHkANypYm0kpbNchug
 RG9ht0IUJesj5k1I3Z+miN36cUP8KEu+uLgevGm5howbjDYoOZknIhOa5IFGPuZmI+AZ
 xVoxV3b3fC4yCln6G43hPIMDBc1r16xroxWY4Og8rbiKR4SPDIOyCbUvIdVDESjv7IUy
 LVC6nm0E026vkUVMSMXanDifX8ru9mgCNc/5Znh1CfJM9ofA7g/Nd81IcbC9KWCPG/SG
 tsIRZ2xfrtFW0Nn2Wuw5P+9ZK3v4h038yf9nekZVruMzHlFNciRRBhU6i/rMgiOTqiAq
 yiwA==
X-Gm-Message-State: AOJu0Yyqm9Iw/d73x8lnoS+u2zOU9NawdJYh/41oo6k2b0Xgwxf1FYXi
 bC/TvFrS6Bd440PQ8/4GUFbXAbF1OnfXEftbA5ewYg==
X-Google-Smtp-Source: AGHT+IHVsinZuWrICTKLM00Gc2dovcRGyrKhxJ37wmOiXQbsxt1Emb50py8tz36rMLpW++su49CiJheSog7u3A45VnA=
X-Received: by 2002:a05:6830:478c:b0:6bd:67c:ba9c with SMTP id
 df12-20020a056830478c00b006bd067cba9cmr18432938otb.35.1694038584610; Wed, 06
 Sep 2023 15:16:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230904020454.2945667-1-dmitry.baryshkov@linaro.org>
 <20230904020454.2945667-3-dmitry.baryshkov@linaro.org>
 <CAE-0n505YyrVi=5TYvYJzwfvNmsxDT_MaR5KPefDAbn3vvhdOQ@mail.gmail.com>
In-Reply-To: <CAE-0n505YyrVi=5TYvYJzwfvNmsxDT_MaR5KPefDAbn3vvhdOQ@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 7 Sep 2023 01:16:13 +0300
Message-ID: <CAA8EJpqGXmip3xxWXxMt7=_vDTof52bbUQFNXL5WbkOCTL8nqQ@mail.gmail.com>
To: Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v3 2/8] drm/msm/dpu: enable PINGPONG TE
 operations only when supported by HW
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, Marijn Suijten <marijn.suijten@somainline.org>,
 Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, 7 Sept 2023 at 00:54, Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Dmitry Baryshkov (2023-09-03 19:04:48)
> > The DPU_PINGPONG_TE bit is set for all PINGPONG blocks on DPU < 5.0.
> > Rather than checking for the flag, check for the presense of the
>
> s/presense/presence/
>
> > corresponding interrupt line.
>
> The patch checks for the major version though?

ugh, forgot to update the commit message after rebasing on top of
Abhinav's core_major_rev series. I'll fix this in v4/



-- 
With best wishes
Dmitry
