Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0C73E854F
	for <lists+freedreno@lfdr.de>; Tue, 10 Aug 2021 23:32:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 356D089C0A;
	Tue, 10 Aug 2021 21:32:21 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D9BF89BF4
 for <freedreno@lists.freedesktop.org>; Tue, 10 Aug 2021 21:32:19 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 v24-20020a0568300918b02904f3d10c9742so815213ott.4
 for <freedreno@lists.freedesktop.org>; Tue, 10 Aug 2021 14:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=2TEOQGiAQW3LJuAkSRtxbwnZcRI4cSybco52ZSAwzug=;
 b=WVkAnSE/ZGx5+Eaqx1oMrPKB2m9ZEuZle+H2fzP31C8LKJ7blO9okOvrJLCQngLMh1
 AYEXnqpEZNMcpoVL3zyjTy+UEMJ3ccQBkrS02f0R78bJPpVcVDwPjIUFcZFhCKtFnaMy
 x8wkpt8HDoL6UpxGKAo7IzrZcHaADNQahWkyo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=2TEOQGiAQW3LJuAkSRtxbwnZcRI4cSybco52ZSAwzug=;
 b=EZpYr5XtP+nQb28piifrmWWbbE4bahbRuBsKLniN9aa1cdUunUlQESeX2KDopaL+d0
 ZaXFY4nDrGvAi1deveI0b3GQFHow9Ty1I33H0HxYgpzwA3WnCxwEQLpVbmt3nXhsSb0F
 AG9MO9iH0CDMNdcPiCMH9hnA7SSH6Tndb0kBItzJeaH/D9PriFeRZ3eQ75ql39RYL47x
 O9Cl3omglpMMVQ7IB4/nbj9ZCCsteA5pGZuz7V4hgfwIqbQD+iMsS3JtjsvRyNZPTq3T
 YPtQQMn+AUxobcHNd4NRLvHJdR6UGGc5TUWbBk1JhYwaVWtSfpAWK06OjI+qxAv8T1W3
 b2ew==
X-Gm-Message-State: AOAM533140/VCTBXYlGtqg2bY6eQxRnzY3Y9e99bUInnhRK+IDiqtj2l
 oQaHndPp8WYVKrG//kGveolTy72c5qetCT21geWVAA==
X-Google-Smtp-Source: ABdhPJzKuHGG5SEuOgiuv6zSynYUbXFakY1O5WFVDqIOV8i6nqaif26ZzTNpPcImURd0czHpta4tzT+W1oQ71p7UW1g=
X-Received: by 2002:a05:6830:44a7:: with SMTP id
 r39mr22526030otv.25.1628631138739; 
 Tue, 10 Aug 2021 14:32:18 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 10 Aug 2021 14:32:18 -0700
MIME-Version: 1.0
In-Reply-To: <1628196295-7382-3-git-send-email-khsieh@codeaurora.org>
References: <1628196295-7382-1-git-send-email-khsieh@codeaurora.org>
 <1628196295-7382-3-git-send-email-khsieh@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Tue, 10 Aug 2021 14:32:18 -0700
Message-ID: <CAE-0n52xzaGKd=5fdXFnqixekRYHf8pfvcp+K3eEZk=+siPH1w@mail.gmail.com>
To: Kuogee Hsieh <khsieh@codeaurora.org>, dri-devel@lists.freedesktop.org, 
 robdclark@gmail.com, sean@poorly.run
Cc: abhinavk@codeaurora.org, aravindh@codeaurora.org, airlied@linux.ie, 
 daniel@ffwll.ch, bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v3 2/6] drm/msm/dp: reduce link rate if
 failed at link training 1
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

Quoting Kuogee Hsieh (2021-08-05 13:44:51)
> Reduce link rate and re start link training if link training 1
> failed due to loss of clock recovery done to fix Link Layer
> CTS case 4.3.1.7.  Also only update voltage and pre-emphasis
> swing level after link training started to fix Link Layer CTS
> case 4.3.1.6.
>
> Changes in V2:
> -- replaced cr_status with link_status[DP_LINK_STATUS_SIZE]
> -- replaced dp_ctrl_any_lane_cr_done() with dp_ctrl_colco_recovery_any_ok()
> -- replaced dp_ctrl_any_ane_cr_lose() with !drm_dp_clock_recovery_ok()
>
> Changes in V3:
> -- return failed if lane_count <= 1
>
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
