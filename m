Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BFFA76FD66
	for <lists+freedreno@lfdr.de>; Fri,  4 Aug 2023 11:34:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E138710E046;
	Fri,  4 Aug 2023 09:34:51 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [IPv6:2607:f8b0:4864:20::b33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3478A10E046
 for <freedreno@lists.freedesktop.org>; Fri,  4 Aug 2023 09:34:50 +0000 (UTC)
Received: by mail-yb1-xb33.google.com with SMTP id
 3f1490d57ef6-d05a63946e0so1955025276.1
 for <freedreno@lists.freedesktop.org>; Fri, 04 Aug 2023 02:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691141689; x=1691746489;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=H8ThC2IHaINUNZ3oJ5TJvDxoaLuSYfKOcGy9mo5uvFY=;
 b=qFbFUW1tYaUSOBV04xzC+xQQNxm7YfZ1lWtgw5KuaDlM+CYehvorgYNbueibs4+5/g
 RkI4gQiHD8Us2fgDSo5+sqL7iX89nSIPh/TJAAEvthbhTapZiWhQobWSkalhUciksD5o
 pP1nNAZT8315i+5BV73eEUoOddBz7x4D9yXyDjLPZGaMfFbajZczMrONgcKNeza9Cyo2
 9PuLvNshTYSRREVQZ86HfCqTiqBdwsXWRr9ImT0Vo1Pu9R9smwVUWv3zXjRTcGeXW7rs
 cxt1sRK8htLZiZiSgj+kSrc5koV2WtWtBoMDyGVD8ueGIUHV5u/0LNtfs4hS0MwZoWFx
 Z6Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691141689; x=1691746489;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=H8ThC2IHaINUNZ3oJ5TJvDxoaLuSYfKOcGy9mo5uvFY=;
 b=fZIzRE2/lihLkVzZuRTv4JdYT3CRN+uGxg2tuXPwpRXhY8moYTQiBwQ4DZ4jRc5Dao
 TDH+GsjAvQqzkmS1ANtU8Ib4eFe2DrTsw4z5S8t6KscW5tbdZXjmiLdR+U4pIWwTBRpc
 heWKRxfLJRIwU6JNTkzZwn8vCOkACij8mHVvWZ9/DSw5Y4DWbyPAPKnivamjJsb/eEZ5
 InaQw6BkYbMVaaKXdPQnR1IUGdSAFxupTMWlpqSz1GaR6W5Y0un6WF/twxoNVMxkiRm3
 lbwST/8hk7zfH/KY9AWlpQhWpAXzRH308g4LF9pG3f7ZEnoWT1hDGh1HgrJPqcJVetNt
 mBBw==
X-Gm-Message-State: AOJu0YxD+z2VkRvYO2xHnWYXGMSRxi7p60Q1NQAYPbFUN3sA0ZbmuFp3
 PKOBFXHno1v7GPmaO0g+2AMFqhAb8Wwdmsa/lYy+dDO/xTsxVSi2QK0=
X-Google-Smtp-Source: AGHT+IGBvfHo1XqtrWAE6Lk5R8gOLP/5uCcg/0NehTYuN0/v1fN19XbIoZZ3PZkP6B8NPO8JGHKBodytPx+oSsejHvs=
X-Received: by 2002:a25:6610:0:b0:d42:11a2:a721 with SMTP id
 a16-20020a256610000000b00d4211a2a721mr874259ybc.43.1691141689271; Fri, 04 Aug
 2023 02:34:49 -0700 (PDT)
MIME-Version: 1.0
References: <75bd8b68-9e7f-40a6-9093-57e39c6e23e6@moroto.mountain>
In-Reply-To: <75bd8b68-9e7f-40a6-9093-57e39c6e23e6@moroto.mountain>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 4 Aug 2023 12:34:38 +0300
Message-ID: <CAA8EJpqoKunLTKjH4CX8oV83b1UBB8EeFLmAoqB7BQnbjpEOtQ@mail.gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [bug report] drm/msm/dpu: drop separate
 dpu_core_perf_tune overrides
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

Hi Dan,

On Fri, 4 Aug 2023 at 08:37, Dan Carpenter <dan.carpenter@linaro.org> wrote:
>
> Hello Dmitry Baryshkov,
>
> The patch 6a4bc73915af: "drm/msm/dpu: drop separate
> dpu_core_perf_tune overrides" from Jul 30, 2023 (linux-next), leads
> to the following Smatch static checker warning:
>
>         drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c:295 _dpu_core_perf_get_core_clk_rate()
>         error: uninitialized symbol 'clk_rate'.

Thank you for your report, I will initialise it to 0.

>
> drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
>     280 static u64 _dpu_core_perf_get_core_clk_rate(struct dpu_kms *kms)
>     281 {
>     282         u64 clk_rate;
>     283         struct drm_crtc *crtc;
>     284         struct dpu_crtc_state *dpu_cstate;
>     285
>     286         if (kms->perf.perf_tune.mode == DPU_PERF_MODE_FIXED)
>     287                 return kms->perf.fix_core_clk_rate;
>     288
>     289         if (kms->perf.perf_tune.mode == DPU_PERF_MODE_MINIMUM)
>     290                 return kms->perf.max_core_clk_rate;
>     291
>     292         drm_for_each_crtc(crtc, kms->dev) {
>     293                 if (crtc->enabled) {
>     294                         dpu_cstate = to_dpu_crtc_state(crtc->state);
> --> 295                         clk_rate = max(dpu_cstate->new_perf.core_clk_rate,
>     296                                                         clk_rate);
>                                                                 ^^^^^^^^
> Never initialized
>
>     297                 }
>     298         }
>     299
>     300         return clk_rate;
>     301 }
>
> regards,
> dan carpenter



-- 
With best wishes
Dmitry
