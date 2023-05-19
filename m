Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E683D709D54
	for <lists+freedreno@lfdr.de>; Fri, 19 May 2023 19:05:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABEA110E542;
	Fri, 19 May 2023 17:05:31 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54BF010E5B4
 for <freedreno@lists.freedesktop.org>; Fri, 19 May 2023 17:05:30 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-4f3a873476bso2079404e87.1
 for <freedreno@lists.freedesktop.org>; Fri, 19 May 2023 10:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684515928; x=1687107928;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tW+IfBA0g2S68983Q4GYfBwGicfanmeJ7cJ4NzLrmh8=;
 b=V585xRsm8CcsnplbCQ6v8bRSw8NP67lu8Y6qp3MaQdh6U4ysP1qSomULxwiyVhVef2
 9b7QW3V0gmptgFhTqIAONlnbRoPWpnZmkp2wBo4S7Lgt9Sw5CeDaoEXwsQtwJZ/5XBOw
 iZw1pi6OYtwzOFNxcz7br42D7dZVChsjBND4HC2K8zpCWneTFOt2jffTWfcwtGiJ94Er
 mFn4RCoJnGx8/J2n0shYt0Ani4J3Kbq9KPC0gXzsOyY4w9ewPdlfa/3nzjvdAfvxT06E
 ELLKks1QOZdU4+NUxLoCHQTmSwrLx4xHJbj2l9Ba9qvrz1qNghS8FwFkhfO0MBXBo/tJ
 htow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684515928; x=1687107928;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tW+IfBA0g2S68983Q4GYfBwGicfanmeJ7cJ4NzLrmh8=;
 b=k3GgR6W2ZBWK1/nF86xmrHEHC6KcU6/CIZDvugCchMemNhLy4TIY7WFiD/wJuxeVrk
 Jf7IhMOoC4VemsxN3cCnBORluWAGGIpkE0FoLOYfw5K+oKgFIL9LCbuBh5CJtE0Ru2KY
 6CiLAHL+w5GW/ZXqSX90sWyMZqG7SH07N9bKUw+/pdj24ZEAZi+IlDp+4XD9vyR4W/Hb
 nRTCZ5SdO+83YAhVMSRpS0V0mQaLuTJIKs0fGxNZEFYWTIApVSHQ611AL3Q4ADOFk0ZE
 uoZEl7Nl66nL3KpcNIT7NrtBmymoODW80v9Vf0MI7piNmJH6Vs/hFGsq6lNIaTAKl7xc
 sPOA==
X-Gm-Message-State: AC+VfDy5x2lN1CSEZBgHWpwuOa561tsHlcW9MFZEkr+kR1rBY5KPPcAi
 vJeNOy7wcHkz3uEUgWRME3gB+Q==
X-Google-Smtp-Source: ACHHUZ4jcrhQebDwz+TmRvBxTkMDnYkD/uxxsLi4fsiBGMpuMGr4N8G5ByGWy90gcsy4dRWMJgQvTw==
X-Received: by 2002:a19:551a:0:b0:4ed:b329:5d85 with SMTP id
 n26-20020a19551a000000b004edb3295d85mr930426lfe.15.1684515928421; 
 Fri, 19 May 2023 10:05:28 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 y16-20020ac24470000000b004f138ab93c7sm648541lfl.264.2023.05.19.10.05.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 May 2023 10:05:26 -0700 (PDT)
Message-ID: <590c8225-e5aa-5195-51d3-a1a4738d6bfa@linaro.org>
Date: Fri, 19 May 2023 20:04:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-GB
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230519170353.3936443-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20230519170353.3936443-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2] drm/msm/dpu: drop the regdma
 configuration
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 19/05/2023 20:03, Dmitry Baryshkov wrote:
> The regdma is currently not used by the current driver. We have no way
> to practically verify that the regdma is described correctly. Drop it
> now.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> 
> Changes since v1:
> - Restored dpu_msm8998_cfg.perf, incorrectly removed previously (Marijn)
> - Also dropped reg_dma pointer from struct dpu_kms (Marijn)
>

Please ignore this, I forgot about 
https://patchwork.freedesktop.org/series/116782/

-- 
With best wishes
Dmitry

