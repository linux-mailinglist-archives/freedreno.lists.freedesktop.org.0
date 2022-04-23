Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F24250C60F
	for <lists+freedreno@lfdr.de>; Sat, 23 Apr 2022 03:39:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E685F10E512;
	Sat, 23 Apr 2022 01:39:09 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12FD710E2D9
 for <freedreno@lists.freedesktop.org>; Sat, 23 Apr 2022 01:39:08 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id r8so10964539oib.5
 for <freedreno@lists.freedesktop.org>; Fri, 22 Apr 2022 18:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=7EJS8NNeeeYMyvlGg/Ekyb4WY0hHCp+wg2fhE6TIsAk=;
 b=RYGnji360BubilqdVVBND2TBvUGRtQqlSZYtbv+32nSrl/HaxDiU9NvStswPNTPHNv
 l5kk4CBhQPBzK8GQA2VPJHjjXUi1R2hmIzm4pifKn2ZVjffCZIePtPtXyHZFwQNqmGFf
 fnjiOnL0u+ncqJZdbj1an/HbxZAaJ1sZeCrXM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=7EJS8NNeeeYMyvlGg/Ekyb4WY0hHCp+wg2fhE6TIsAk=;
 b=sVto6RpYU7Sc/hscSeDx+Q1tLpl0AlN4pMzfgQdt28F5C65a5J8t79Uu978yhg1Iyn
 ZBeeNfOxW/BzvtSC2++fjjCJiQGaDbO+m7BstqlbItW/DmYEUIF59hTX6UMC2B9jqAQm
 ZtOHyi1yTe0T1Ewv6g17Q4Oa2bgHlXA39x0UOpD92e4tTZP4BcFPb22GgsLGt7X8B803
 U/4c81zU8WIOJobnYAYm2WpLPwoEIgS+LH7RdNP2Jw9fArsLqIYhmmCek+uM8sp40hHZ
 F72jD/Jhu0nEGaihNMBwskrf8XEjdgtDDRo07h9apMXyToBMl67N4LVhbaO9NF+Mcdjk
 08aw==
X-Gm-Message-State: AOAM532E5wrEjqiCY4myJRE6u4m3J031hajYHp1XNE08ZZCaAu9Gfpcb
 TsnDnGMWLbNeKoj1chQxNN4+KUJaxsob+VZ16aGWdg==
X-Google-Smtp-Source: ABdhPJykwLPlALEXFN/14+I62z2Ro0mrF6nz4lBhvSBstY/qhvFmCUzDDHH6zZMWwVedGzrAP/waI44abrHx0IYwWCQ=
X-Received: by 2002:a05:6808:1296:b0:325:8fb:68f3 with SMTP id
 a22-20020a056808129600b0032508fb68f3mr56442oiw.193.1650677947414; Fri, 22 Apr
 2022 18:39:07 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 22 Apr 2022 18:39:07 -0700
MIME-Version: 1.0
In-Reply-To: <1650618666-15342-5-git-send-email-quic_sbillaka@quicinc.com>
References: <1650618666-15342-1-git-send-email-quic_sbillaka@quicinc.com>
 <1650618666-15342-5-git-send-email-quic_sbillaka@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 22 Apr 2022 18:39:07 -0700
Message-ID: <CAE-0n52Lh_+_cPq7ivi0GHaUkY8_mH4nsvXeBBEbVRHLvHDYcw@mail.gmail.com>
To: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v9 4/4] drm/msm/dp: Support the eDP modes
 given by panel
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
Cc: quic_kalyant@quicinc.com, dianders@chromium.org, quic_vproddut@quicinc.com,
 airlied@linux.ie, quic_abhinavk@quicinc.com, steev@kali.org,
 quic_khsieh@quicinc.com, robdclark@gmail.com, seanpaul@chromium.org,
 daniel@ffwll.ch, dmitry.baryshkov@linaro.org, quic_aravindh@quicinc.com,
 bjorn.andersson@linaro.org, sean@poorly.run
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Sankeerth Billakanti (2022-04-22 02:11:06)
> The eDP controller does not have a reliable way keep panel
> powered on to read the sink capabilities. So, the controller
> driver cannot validate if a mode can be supported by the
> source. We will rely on the panel driver to populate only
> the supported modes for now.
>
> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
