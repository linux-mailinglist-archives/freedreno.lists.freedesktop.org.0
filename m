Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1EEA486FA8
	for <lists+freedreno@lfdr.de>; Fri,  7 Jan 2022 02:21:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 675D910E6DF;
	Fri,  7 Jan 2022 01:21:17 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BF5E10E6CB
 for <freedreno@lists.freedesktop.org>; Fri,  7 Jan 2022 01:21:15 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id q186so790626oih.8
 for <freedreno@lists.freedesktop.org>; Thu, 06 Jan 2022 17:21:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=/9SlotMENCux44wQbAsfKzhy+Cu/ZqcUuwyf9fYDVkE=;
 b=UjvIM9QYo+bY3BEpxncpQS7NXTJ9Y+lJTVCkI1V89b/w+7SFs8f2s8I25f2i7Q/6zx
 n5x07iBtgeEolKmAml2Ia5epbuu468orBW8naOxwe+LQ9hsKk+BWR6O4XEq+tv1uK6Dh
 +qDn8fbsX25q2JYWLk8SdEFxx6MZgHBnVXJjw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=/9SlotMENCux44wQbAsfKzhy+Cu/ZqcUuwyf9fYDVkE=;
 b=ybYh2ggyfvmEncfOcKmFLHs/fLqYx9QjXHmYc1umUuwmg1x+mp2p1uaeYTxX+JpJv2
 9bt3UP+x5eSxkDIV5BlH1Qf2U8Ir8bp6MFtNqCOu6IpIYo7CwS1cOXTzPU9POhXD743b
 U1PjrdIExdGVdanV+/wj/lPBvh0dZhCXAEw5s/imAGf7RYf6LI3eVTLvGEp1yPHL1y7K
 FMVZsNdSQy4EdF6QMWHcF6KnTQ1CXfZfFyRg7r/w1fEuvTG6dsBJ6auKMvMbK5F1c52O
 QwM0RTXwnUIcHqeAxc19cCmv5LQuz6Y/+B3ky0FjnCJcbBPLDLvvylNQ4Jq49XC+Ygwz
 5Xug==
X-Gm-Message-State: AOAM533bwZqnPSNXUhU4GfbU3z1AEaTAmhy/N8Lkd3XwhUizzup9qlQc
 yxGAOtRf4V65M//ZiU/cNwnIEiuTPdbx2n9e+caUUA==
X-Google-Smtp-Source: ABdhPJyvya1hnP9xuBJucbgcNWItbLuNz5uYbCgMd74jX/VjprlkduKp3+30krJxD2G1v8kziq3fNXKT/i3DTelj134=
X-Received: by 2002:aca:a953:: with SMTP id s80mr8300111oie.164.1641518474906; 
 Thu, 06 Jan 2022 17:21:14 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 6 Jan 2022 17:21:14 -0800
MIME-Version: 1.0
In-Reply-To: <20220105231031.436020-5-dmitry.baryshkov@linaro.org>
References: <20220105231031.436020-1-dmitry.baryshkov@linaro.org>
 <20220105231031.436020-5-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 6 Jan 2022 17:21:14 -0800
Message-ID: <CAE-0n53V9UZ6+dF9JXdFKP7P7tLoQV=rDcuraEmen9t3EUHinA@mail.gmail.com>
To: Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v4 4/5] drm/msm/dpu: stop embedding
 dpu_hw_blk into dpu_hw_intf
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-01-05 15:10:30)
> Now as dpu_hw_intf is not hanled by dpu_rm_get_assigned_resources, there

s/hanled/handled/

> is no point in embedding the (empty) struct dpu_hw_blk into dpu_hw_intf
> (and using typecasts between dpu_hw_blk and dpu_hw_intf). Drop it and
> use dpu_hw_intf directly.
>
