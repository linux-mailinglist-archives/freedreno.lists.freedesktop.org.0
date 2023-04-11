Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7256DE438
	for <lists+freedreno@lfdr.de>; Tue, 11 Apr 2023 20:45:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EBC110E60B;
	Tue, 11 Apr 2023 18:45:56 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 511EC10E352
 for <freedreno@lists.freedesktop.org>; Tue, 11 Apr 2023 18:45:54 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id by8so9273357ljb.13
 for <freedreno@lists.freedesktop.org>; Tue, 11 Apr 2023 11:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1681238752;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=Kt2nTK/L2DMh4Zod0ujL6feEggrKXdzfpI6LEwT2JUk=;
 b=Hs81WUoiVVFIM+ivFPb/jQA3EmIEneKSPEVpUp08IzmbfAww4C0KWAmhuzCDQdWke4
 JyeLR5vVRVO9FjudX6lOApI6Ywfr8cn1X0PHR0kvAemCLBX74PYeyck85YfJnOvReWRP
 tzL8xVJchOm3iJgFtKbDexvKRPhNCqCKZrEaE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681238752;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Kt2nTK/L2DMh4Zod0ujL6feEggrKXdzfpI6LEwT2JUk=;
 b=Ie78LwXOBhiZkAVKaRU894zqWpG/JY3endNqZKnc5PYL7KmE/1GHi3XladvF32tcJ+
 Du2sjMii6MIdfE96GwIKkSJDR2wyDzQSJMW+zaTYT3c0D9U7y0HdlF4GH720jSGfgLBl
 JpPwoxSsBxwBCimTcxk+DBW17jCNtHVvc3Y2JyKdAUHQy0uTEv6O02h9JbRCReccvmmf
 1noCWD2feVhe06LAyRNyeT8wS3Jh6vFddGoDJ+0a2EP8MOySpcfJFKrPsXmy9vAIVQ+v
 4kpHM46f0aiwlyPqj9LenDWv+/aVaCSK2MLqJnwmdyZ0Z6chyE/jR7vWgKIrf2WLRFeC
 40bg==
X-Gm-Message-State: AAQBX9eXCH94Qz4xnSgSsyYCLdzmJFnYeIRqAWDUpNFwELxGemdanLGW
 IZf6snyNtlhHKAKdhwD485kbnN266VZ/1lUmX9rKwA==
X-Google-Smtp-Source: AKy350YpHKHopzwKahp7ULmovKXZ2doN6DUUuycpVkj4o70reVBikNejCvg9q/0Hmnr3kFqrFu9jis5M6LrN1eYn65U=
X-Received: by 2002:a2e:b0c4:0:b0:298:b320:ee2d with SMTP id
 g4-20020a2eb0c4000000b00298b320ee2dmr71986ljl.0.1681238751946; Tue, 11 Apr
 2023 11:45:51 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 11 Apr 2023 11:45:51 -0700
MIME-Version: 1.0
In-Reply-To: <20230411161903.599222-1-dmitry.baryshkov@linaro.org>
References: <20230411161903.599222-1-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 11 Apr 2023 11:45:51 -0700
Message-ID: <CAE-0n5370mhqN7egoTAWaLTHR-qYZu4R99aPJbrXe7snv3rerw@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2 1/2] drm/msm/adreno: warn if chip revn is
 verified before being set
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

Quoting Dmitry Baryshkov (2023-04-11 09:19:02)
> The commit 010c8bbad2cb ("drm: msm: adreno: Disable preemption on Adreno
> 510") tried to check GPU's revn before revn being set. Add WARN_ON_ONCE
> to prevent such bugs from happening again. A separate helper is
> necessary so that the warning is displayed really just once instead of
> being displayed for each of comparisons.
>
> Suggested-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
