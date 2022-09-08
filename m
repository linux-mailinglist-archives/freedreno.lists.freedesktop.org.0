Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B774B5B231E
	for <lists+freedreno@lfdr.de>; Thu,  8 Sep 2022 18:07:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65AA410EB4B;
	Thu,  8 Sep 2022 16:07:39 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com
 [IPv6:2607:f8b0:4864:20::112d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9720910EB49
 for <freedreno@lists.freedesktop.org>; Thu,  8 Sep 2022 16:07:33 +0000 (UTC)
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-3450a7358baso142672607b3.13
 for <freedreno@lists.freedesktop.org>; Thu, 08 Sep 2022 09:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=JJv51cMEwPKHeGHtyDWtDlnrabxmd1GuWDEXM9pG4rU=;
 b=TcrxrJCtL6pyn3nnmMSCsZMPhcs5m3fyi2iV7TKoaOShZwoPJQYgjIx1KBYqXESOP0
 bNBni7sHtK8MyEgvjgrpp9gur+gQLZj+Q80cmIREIB/RY5abPTO5tOnxFz9MXRG2zAar
 117pLJeiY50esGdC1pApVgf1nKk0IeyoJawvZDOf+oLvJ5A3IdPLmHWZdai1sW8jlrMb
 xwzeasSr/jc0rmPNyLp5Ak2o/AWa7XoT5FdGPt4i8iaKYZyk2vwijRjgAAhGmtRjhhJg
 Ga9S67aUzkZzbjdoTAAvgPD6bPdvsVs0DJbIvQEU9UZrrTy4JUidRk74VH05GppL80F+
 SGHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=JJv51cMEwPKHeGHtyDWtDlnrabxmd1GuWDEXM9pG4rU=;
 b=rV5J7LAAJTcSY3JzMx+1oG7tj7rVceoMPhDl7KoGEUzsm77+dSCDtskuxDM6l+cx/b
 j31SW2ipInwoaF8eOlXWYJ/XrWolcR8tU/7eNk3PGvNR2v0d/JvuW4ZWeh96cWAjx0xq
 BeNQghisITrZghzn5I0wEc+z8xWdii6rt3q/7GH5RkEiq8MOdqtt7AVWTU8d7qe+bWzX
 bIYi2jmoKy9Gnm6Oj+a7yEWthdBw+Yz3UxalhHUoRXrMAHCEDH8D5fRnVKo8n3vWQpH2
 J3XatVYHZyXgOROAcyRz+iNNwf4fDRZ3CExUI70rmW9g1kt2Ge5/m5dPJpg2wMTjPiKc
 LVnA==
X-Gm-Message-State: ACgBeo2R3zk9mwy3F3KvNXfzjaa6yDTP70LICZb+DjndNiRS4JHOyCBN
 SgU4D/YurVk3mzHT+rtz+v2h9R1our2TprABVqlfcQ==
X-Google-Smtp-Source: AA6agR4zjZ5M4DR5iRReMpuVoqJUCuQUa9QEuRg73CcLPLa7gZkhLwEqcDY/mIHWG91nOJscsrrtch3EhKjLReFSL5I=
X-Received: by 2002:a0d:ffc5:0:b0:341:6cc1:c589 with SMTP id
 p188-20020a0dffc5000000b003416cc1c589mr8431078ywf.418.1662653252731; Thu, 08
 Sep 2022 09:07:32 -0700 (PDT)
MIME-Version: 1.0
References: <1662651516-30283-1-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1662651516-30283-1-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 8 Sep 2022 19:07:21 +0300
Message-ID: <CAA8EJpr_cBTyugJx1qZCEEgsdNvxHmZ7TPZiqRu_kb=NNNVLKw@mail.gmail.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v3] drm/msm/dp: cleared DP_DOWNSPREAD_CTRL
 register before start link training
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
Cc: quic_sbillaka@quicinc.com, quic_abhinavk@quicinc.com, airlied@linux.ie,
 freedreno@lists.freedesktop.org, robdclark@gmail.com,
 dri-devel@lists.freedesktop.org, dianders@chromium.org, vkoul@kernel.org,
 agross@kernel.org, bjorn.andersson@linaro.org, daniel@ffwll.ch,
 linux-arm-msm@vger.kernel.org, swboyd@chromium.org, sean@poorly.run,
 linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, 8 Sept 2022 at 18:38, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> DOWNSPREAD_CTRL (0x107) shall be cleared to 0 upon power-on reset or an
> upstream device disconnect. This patch will enforce this rule by always
> cleared DOWNSPREAD_CTRL register to 0 before start link training. At rare
> case that DP MSA timing parameters may be mis-interpreted by the sink
> which causes audio sampling rate be calculated wrongly and cause audio
> did not work at sink if DOWNSPREAD_CTRL register is not cleared to 0.
> This patch also make sure bring sink out of D3 power-down mode into D0
> (normal operation mode) successfully by retrying 3 times.

Split into three separate patches please.


-- 
With best wishes
Dmitry
