Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A837BC2EB
	for <lists+freedreno@lfdr.de>; Sat,  7 Oct 2023 01:29:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C59810E579;
	Fri,  6 Oct 2023 23:28:58 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1321E10E578
 for <freedreno@lists.freedesktop.org>; Fri,  6 Oct 2023 23:28:55 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-5068692b0d9so1316103e87.1
 for <freedreno@lists.freedesktop.org>; Fri, 06 Oct 2023 16:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1696634934; x=1697239734;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=dPje1vcHjwIpo51r2lCV1V3PJPkC5dj3H0BmMKBs+B8=;
 b=nsIFhkIPR9ZLDiIpwMFzdMtYBuzXP+qVeHKGYxdJREEXj95n1YD/FDcpPAgRg0bWPt
 GyUwKY2yXetx4gMhh8h+T+qWcqswShIF/avK9Rntq1NatSmIlVVxqGb2LXa2aJLM8lon
 dBon6jQ2jxOQahMJXkQhWj1lnELe0yuhMHhBg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696634934; x=1697239734;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dPje1vcHjwIpo51r2lCV1V3PJPkC5dj3H0BmMKBs+B8=;
 b=h4K40Zc9pvIC6HWoVb/NLp0RcdOiGWMz99cIjg/WwlvZerv94FArzc0JzjapMHEBpK
 6BrE8zmh+H0Ky649jvvp3y0ScpDmHJ28/ItoyUmFgMMr66uLx549cN1KTMoZx8XYIQMg
 X6GM31KSqUkew1BLRUCa9hOczPpm1Vr1Rt9OOOSXW5JGhLTASzbIT/Gav9fpit7l/1nq
 4n+LGjBG+9MIK7IRuweMsqmXGyVZOceIy5E7Md94ZQKZvD7koW8Q8nA1nQNE11zu85To
 DWkBxPTuwyxA0JVcb3vP5dS1KdvacNUPIGPtxJ3lNPIoHq5IoOiZlT2y+9sKw7WdTnBk
 ZwRg==
X-Gm-Message-State: AOJu0YybaDyeWrt/CgbtZt60qKB55G1V1yLl1aVK4OzahTCAwO2iaGPs
 ymucoODi7YEL0SXehF2gf91l4ndAfzRH6rX7A8uBdg==
X-Google-Smtp-Source: AGHT+IFlu3AoscCuX5mmu2dgMoFvoKMHgZth8cXyCHPtypScwGpaNG9cgu2tQKhK5xO5BoEwsJpp2QIly6mZQq0bu0Q=
X-Received: by 2002:a05:6512:282b:b0:505:7371:ec83 with SMTP id
 cf43-20020a056512282b00b005057371ec83mr9877611lfb.48.1696634934093; Fri, 06
 Oct 2023 16:28:54 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 6 Oct 2023 23:28:53 +0000
MIME-Version: 1.0
In-Reply-To: <20230903222432.2894093-1-dmitry.baryshkov@linaro.org>
References: <20230903222432.2894093-1-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 6 Oct 2023 23:28:53 +0000
Message-ID: <CAE-0n50VFdySRJ2ErAzL6UW2Rn9cbpPbd4sAJoJ2fPmVv-8-4A@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] drm/msm/dp: support setting the DP
 subconnector type
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
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2023-09-03 15:24:32)
> Read the downstream port info and set the subconnector type accordingly.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
