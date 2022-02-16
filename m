Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03ACF4B7CFF
	for <lists+freedreno@lfdr.de>; Wed, 16 Feb 2022 03:00:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A039D10E35D;
	Wed, 16 Feb 2022 02:00:17 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com
 [IPv6:2607:f8b0:4864:20::c33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C5D610E5F7
 for <freedreno@lists.freedesktop.org>; Wed, 16 Feb 2022 02:00:16 +0000 (UTC)
Received: by mail-oo1-xc33.google.com with SMTP id
 o192-20020a4a2cc9000000b00300af40d795so827443ooo.13
 for <freedreno@lists.freedesktop.org>; Tue, 15 Feb 2022 18:00:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=Y39GGSzmxBUHOwxgKdq6ykyZOrHUIJsCDTwfMhkJMyo=;
 b=DgMTmya6/M0gMhg3H7XHoavHD5THzZHhmJog19F7nTTDjjqNjdnFc8kEiKO5OmryM1
 ZExHNdw/YhLTVdd/r39ymYadzzUyH+FwpW7XRvuy3zg7WHcArO1BJXl/7C7Si20NANPz
 9ngK3tfttC7JAkiZLd44R4Ck4If1Lf1c/FUGY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=Y39GGSzmxBUHOwxgKdq6ykyZOrHUIJsCDTwfMhkJMyo=;
 b=fQYt9wvGr1lpMU2gRWDTWTdctewpxwlQjjjMPrF2PKyKQ4YxnqHSuW+ivR3hOtNN19
 2LyaJaHxg2SLqiX3TpjqFCowpvYTQrxOCodowDlgO3Qi9kKBa6jExSbM3jxrFOz8irH1
 U1QQGUAUI2n2l4yGEg3A9xD+TLs3AvcOkUZYxDY5FS4lbO+j5e9COk4XI88CFw1dL5Ex
 6lPCFjs7FNrMUPTS7cawqkDLnoqvIW1Uw+LpKnZpJi1Fms20zgl9mVzgbP4F92zsJUa0
 6GqBZA25/I/+Z1kdN5LwCLQyGvaxkacASk/vNpOH/+e0NqvFADdsCQee2G/+GVmrw3zh
 8PZQ==
X-Gm-Message-State: AOAM530QuAJNjk1jBIxfE1fQo3AkxLRdjvQcXOBr7f4bHUKsx/5WeBlp
 l7I63xEjpJWdpBrmaAH4BJDKGce3K3dqE3La2t5CTw==
X-Google-Smtp-Source: ABdhPJwdV21EEUJFlMWgJeVNAtf4tA1g3nuw0qBk6FBZAxwGFFZ/I/0I+Ue+GCLgLME2YDh8bl+g9B8Ahc2JRkcq55E=
X-Received: by 2002:a4a:d58b:0:b0:319:8746:ac3e with SMTP id
 z11-20020a4ad58b000000b003198746ac3emr207163oos.1.1644976815890; Tue, 15 Feb
 2022 18:00:15 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 15 Feb 2022 18:00:15 -0800
MIME-Version: 1.0
In-Reply-To: <20220215141643.3444941-8-dmitry.baryshkov@linaro.org>
References: <20220215141643.3444941-1-dmitry.baryshkov@linaro.org>
 <20220215141643.3444941-8-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 15 Feb 2022 18:00:15 -0800
Message-ID: <CAE-0n53y6x+4aqQMjwgQ=W-m2v5BjaFQptLB+D8dh0R8n-pzhQ@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2 7/8] drm/msm/dpu: pull connector from
 dpu_encoder_phys to dpu_encoder_virt
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

Quoting Dmitry Baryshkov (2022-02-15 06:16:42)
> All physical encoders used by virtual encoder share the same connector,
> so pull the connector field from dpu_encoder_phys into dpu_encoder_virt
> structure.

What is the benefit? Less code? Clearer association?
