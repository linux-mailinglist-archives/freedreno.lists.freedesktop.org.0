Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1982C714223
	for <lists+freedreno@lfdr.de>; Mon, 29 May 2023 04:46:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5754110E205;
	Mon, 29 May 2023 02:46:47 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 749A510E203
 for <freedreno@lists.freedesktop.org>; Mon, 29 May 2023 02:46:46 +0000 (UTC)
Received: by mail-yb1-xb29.google.com with SMTP id
 3f1490d57ef6-bad010e1e50so4376277276.1
 for <freedreno@lists.freedesktop.org>; Sun, 28 May 2023 19:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685328405; x=1687920405;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ph880e8MF0wc4IALigXnFuTJi6uS7j07LdwC0MdSrjk=;
 b=mq9h/9QxGt+AkCa8P6rXuVjk5W3d4mYreBARwPOKmMsT/P62MbElVh/HGncLuSL52v
 NdIvdcSfwP0aaSU3xCcZw8oJfqIIV9NRb/ETa7c95M3zgIgR5zcK4pXqcAszikChSCLX
 Xw3w403Rl9lZV/Z7XV2hJDFIzpw0CaYxN/07iCyn7Jj7ekCjNwslFruPUcs8+PM4BqDr
 0RVsXB9s16an4qHh4xNYl5Hif8OBUqh8PvfRJfsl7pHx+COLl3Ow2aO2aHO9mhFFi62K
 1U0aRviBl6rx6lTsG/WEpJ++g1MZafXgAC7DXDlJp0kcwOKfA+rQuFXdVmefuLDs+lFh
 D7iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685328405; x=1687920405;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ph880e8MF0wc4IALigXnFuTJi6uS7j07LdwC0MdSrjk=;
 b=Fffd2FUVJpVKWWvyO1mLsBQfJu/dadtyxZWticdBVEHdqtEi0x6Dzs8tfjR9ekI1rT
 J9UdEriEC43i2A7LVKRkIpvQxomZTijWwGWfgcNVyGMUnnqYsiBVLxw/v8SsXxkVrENo
 J+eV2MmI4r2/koz0rz18rEaPwcl46hXWu6hYovARbZMCZSyDj4QJoOw8qH1piDKkgbLf
 3md67SErhTmQ4fbkhPS83YmVMG1f9YVUsNb8Gv6H5tLk+idE/EuSe2X7xKQ19Tczyum7
 XQTori53rondgUhD3G/n991KR5sNZfffnpRjj2VKSv/UKsGSw+5sh2GeZZb6caCYe2Tw
 0V+g==
X-Gm-Message-State: AC+VfDzGfOf0d+QzebUrn0FB8hUu2fFPPu3W281bSo9fN2h43KXUWKEX
 5UAj7gv9ozzXLY6uf0KTIc1+hZg+gxS+LG6LSznxLEfpS0OUoCuP51w=
X-Google-Smtp-Source: ACHHUZ5qdJm6h5814CvP7cAwdBtx4Li3TICtfIx25zo0gn1EHsglYbAQuc54mUivkrltwxS+8TxVvnzyqmvUVfeDZAE=
X-Received: by 2002:a81:4fd5:0:b0:565:b4e9:74a7 with SMTP id
 d204-20020a814fd5000000b00565b4e974a7mr10092033ywb.47.1685328405071; Sun, 28
 May 2023 19:46:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230417-topic-dpu_regbus-v1-0-06fbdc1643c0@linaro.org>
 <1c9ee3ec-2e69-9782-81e3-e9835c4bf7ef@quicinc.com>
In-Reply-To: <1c9ee3ec-2e69-9782-81e3-e9835c4bf7ef@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 29 May 2023 05:46:34 +0300
Message-ID: <CAA8EJpoA8nsaTrmUkZ-TceOezfTnuM+hUL5Xs_TAFNg=4W95XA@mail.gmail.com>
To: Jeykumar Sankaran <quic_jeykumar@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH 0/5] MDSS reg bus interconnect
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
Cc: freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed, 19 Apr 2023 at 21:50, Jeykumar Sankaran
<quic_jeykumar@quicinc.com> wrote:
>
>
>
> On 4/17/2023 8:30 AM, Konrad Dybcio wrote:
> > Apart from the already handled data bus (MAS_MDP_Pn<->DDR), there's
> > another path that needs to be handled to ensure MDSS functions properly,
> > namely the "reg bus", a.k.a the CPU-MDSS interconnect.
> >
> > Gating that path may have a variety of effects.. from none to otherwise
> > inexplicable DSI timeouts..
> >
> Current DPU driver already votes on the "reg bus" indirectly through the
> display AHB clock handle[<&dispcc DISP_CC_MDSS_AHB_CLK>] in DTSI. Can
> you provide more details on the issues that warrants this patch series?

Does that mean that if we cast a proper vote on the SLAVE_DISPLAY_CFG,
we can drop the DISP_CC_MDSS_AHB_CLK clock?

Also, I'd like to point out that SDE does both things: it casts the <1
590 xxx yyy> bus votes and enables the DISP_CC_MDSS_AHB_CLK clock.


>
> > This series tries to address the lack of that.
> >
> > Example path:
> >
> > interconnects = <&bimc MASTER_AMPSS_M0 0 &config_noc SLAVE_DISPLAY_CFG 0>;
> >
> > Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> > ---
> > Konrad Dybcio (5):
> >        dt-bindings: display/msm: Add reg bus interconnect
> >        drm/msm/dpu1: Rename path references to mdp_path
> >        drm/msm/mdss: Rename path references to mdp_path
> >        drm/msm/mdss: Handle the reg bus ICC path
> >        drm/msm/dpu1: Handle the reg bus ICC path
> >
> >   .../bindings/display/msm/mdss-common.yaml          |  1 +
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c      | 10 +++----
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            | 34 ++++++++++++++++-----
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h            |  5 ++--
> >   drivers/gpu/drm/msm/msm_mdss.c                     | 35 ++++++++++++++--------
> >   5 files changed, 57 insertions(+), 28 deletions(-)
> > ---
> > base-commit: d3f2cd24819158bb70701c3549e586f9df9cee67
> > change-id: 20230417-topic-dpu_regbus-abc94a770952
> >
> > Best regards,



-- 
With best wishes
Dmitry
