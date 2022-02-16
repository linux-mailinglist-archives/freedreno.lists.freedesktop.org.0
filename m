Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B5B4B7D0D
	for <lists+freedreno@lfdr.de>; Wed, 16 Feb 2022 03:13:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1877D10E5FE;
	Wed, 16 Feb 2022 02:13:23 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [IPv6:2607:f8b0:4864:20::72f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96F8D10E601
 for <freedreno@lists.freedesktop.org>; Wed, 16 Feb 2022 02:13:21 +0000 (UTC)
Received: by mail-qk1-x72f.google.com with SMTP id o10so607923qkg.0
 for <freedreno@lists.freedesktop.org>; Tue, 15 Feb 2022 18:13:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=633/kcGFp+Bu8soejxxfIa5w0BAskL4NcDa75DnlBvg=;
 b=BEvAvpEadNVOU5zOf00p/LinV3MSMuiM6l0UehZ9p+CNJL8x7K6yQqJ/31uRU1Cdmq
 17WNOMoRi+hfJxPakD9yzDPTugdFwTe1V1LOyDgdzLMse+0kDW029LqlSscEmx+64zVo
 B9kakBW/1KCZjyrmSR1opd3USKqpyHCiwbFFqtyq4YZJF8WIGqsXWjr7P+OoFd/Uq/o1
 fbP/lLuPSDxsOybncInpkMIq5KGdIPRV9sxACT2IC9/8Mz1Dy7xQMlTGNVzuov+uQfC3
 CcHGD25AiunUjezvz19Wzv6RbF9pW9s2+PyCIe9GUuXYgPJ1hHx6qV4rkGo/HwZV9rTs
 lTwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=633/kcGFp+Bu8soejxxfIa5w0BAskL4NcDa75DnlBvg=;
 b=iuK72nYYEaurc4Hl/Pg6t4zilSZAIJrl0peCuCoAH7oCe7MiAsn9f+qU86Ep6PYLYi
 DFP4r5YZ0cRwlt9AZZtovesaxICDnVZxnW/vn4KQSOz3SbUXOHMrSt3pu7WlspIzm8UL
 cBIOZGLjyelSn3Tus8KUF+o2y9vzNQduYnsMLH4mp3i5Z6PxVxWNZjG+4F6N93sPRx8g
 OvEiFBOEVCLhjBiB63+Fu0Thz1YE3NiXpX0Nt7fFEJ1XFRQfLYiLchKQEnWYauyiEhC0
 pGOLeNJgZHU9MIxxnRj/baH3L8R+y3mhcQwMfXU5FoOrgU1/TvXMnBPw/+yHvMgGJDKZ
 ImYw==
X-Gm-Message-State: AOAM531LHjLAIVeJ9Krx2Vr/jKRXMZjxNJgPbN12swzh+t0M2bqlcsbw
 OqgBJwAD5xobxvW7DwpCw6tPt8lUeig2KdljCk5QNQ==
X-Google-Smtp-Source: ABdhPJyqPMY2nDAAkDpO1ed3x3bQ7KaH2mUKTwigY6Tx+GyBLn0C1HYHEfNIVOQinK3Hzemaf3EI3DW3XKw4M4VSrow=
X-Received: by 2002:ae9:c10e:0:b0:474:c146:32a7 with SMTP id
 z14-20020ae9c10e000000b00474c14632a7mr353330qki.203.1644977600496; Tue, 15
 Feb 2022 18:13:20 -0800 (PST)
MIME-Version: 1.0
References: <20220215141643.3444941-1-dmitry.baryshkov@linaro.org>
 <20220215141643.3444941-8-dmitry.baryshkov@linaro.org>
 <CAE-0n53y6x+4aqQMjwgQ=W-m2v5BjaFQptLB+D8dh0R8n-pzhQ@mail.gmail.com>
In-Reply-To: <CAE-0n53y6x+4aqQMjwgQ=W-m2v5BjaFQptLB+D8dh0R8n-pzhQ@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 16 Feb 2022 05:13:09 +0300
Message-ID: <CAA8EJpqhKdYBisj9qEExKX20zPLpBnCs12FAYYSTo89hcXa48Q@mail.gmail.com>
To: Stephen Boyd <swboyd@chromium.org>
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed, 16 Feb 2022 at 05:00, Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Dmitry Baryshkov (2022-02-15 06:16:42)
> > All physical encoders used by virtual encoder share the same connector,
> > so pull the connector field from dpu_encoder_phys into dpu_encoder_virt
> > structure.
>
> What is the benefit? Less code? Clearer association?

Clearer association. Otherwise code suggests that different phys_encs
can have different connectors.

-- 
With best wishes
Dmitry
