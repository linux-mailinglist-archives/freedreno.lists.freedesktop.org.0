Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4102042AACC
	for <lists+freedreno@lfdr.de>; Tue, 12 Oct 2021 19:30:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1FB96E823;
	Tue, 12 Oct 2021 17:30:53 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com
 [IPv6:2607:f8b0:4864:20::c30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7387E6E823
 for <freedreno@lists.freedesktop.org>; Tue, 12 Oct 2021 17:30:52 +0000 (UTC)
Received: by mail-oo1-xc30.google.com with SMTP id
 i1-20020a4ab241000000b002b7069d0e88so1825654ooo.5
 for <freedreno@lists.freedesktop.org>; Tue, 12 Oct 2021 10:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=z/0YDsWVgY8iQTsDuzbYnenwugKkL3hk/JKxgPGOGcI=;
 b=HkxFstT0p4m1QLP90AGW9wtYHvxedTtvyniXxElQkMbozckVbZpY+ySg4/JdDB/trd
 YmtybS62NmQKyuSF2NuUNk/j75EMhjXpkPYyXZ03J2Jfu55793aAlYSZtNV7lFbJFFi6
 sWDSf+PNXbeErsE4e2zK60JCUsOUnmb+5L7FY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=z/0YDsWVgY8iQTsDuzbYnenwugKkL3hk/JKxgPGOGcI=;
 b=nluHd22VeEqgWRCEXqsHxW4HRw6jSJXt2nN/BWYRJqQNkkBTLEdIwwSi0zNiqBq8au
 Zhx/BfWTPysWxPDbEVrQqX9WX3voZ4q5i0jieMdt1KeyYOdwp04jYvX1ZuqOsGOEfCzL
 tx3f5tEHdhboRrep/VTDeK8mDt93SlDndrC4CdKrKKDcBcqVhCd8/2/5Fql0zkxfXxe6
 O65HhPcAHb2VUk2YzdppBOu33+dsANoOHbnkBZ+s+YOkEYObp6X0rL7J5bGqQMHQSXub
 dk46E6dMyLqhnhWE92NoQCpJe9lWFuUOjhf03l7dG+ytn1J6NLnBGhbmh7rHnpPLPNnJ
 eSWA==
X-Gm-Message-State: AOAM530aFNgZkBD3p1Vv4iVZQBhvXvell6T27k+QRkMhTtn0CZiOuBdH
 GonAUyvD2rWLgEB8VgHEKpq6PASw7JR4+P4kM1OXrg==
X-Google-Smtp-Source: ABdhPJy9T8+9hT9hWwhL5IEf1cezLhdiiM+LB8rzFUvZfxvbjfDkAnsx9qGc3DeOFqc5EwvCafjQFtUNNiGGxNd26F8=
X-Received: by 2002:a4a:e2d3:: with SMTP id l19mr24660471oot.1.1634059851594; 
 Tue, 12 Oct 2021 10:30:51 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 12 Oct 2021 10:30:51 -0700
MIME-Version: 1.0
In-Reply-To: <20211011201642.167700-1-marijn.suijten@somainline.org>
References: <20211011201642.167700-1-marijn.suijten@somainline.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Tue, 12 Oct 2021 10:30:51 -0700
Message-ID: <CAE-0n52raCkcBxz0nfdtGK_kR+cQptT5dVXgDBj2fhCySQOVTQ@mail.gmail.com>
To: Marijn Suijten <marijn.suijten@somainline.org>, phone-devel@vger.kernel.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Martin Botka <martin.botka@somainline.org>, 
 Jami Kettunen <jami.kettunen@somainline.org>,
 Pavel Dubrova <pashadubrova@gmail.com>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>, Jonathan Marek <jonathan@marek.ca>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2] drm/msm/dsi: Use division result from
 div_u64_rem in 7nm and 14nm PLL
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

Quoting Marijn Suijten (2021-10-11 13:16:40)
> div_u64_rem provides the result of the division and additionally the
> remainder; don't use this function to solely calculate the remainder
> while calculating the division again with div_u64.
>
> A similar improvement was applied earlier to the 10nm pll in
> 5c191fef4ce2 ("drm/msm/dsi_pll_10nm: Fix dividing the same numbers
> twice").
>
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
