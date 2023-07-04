Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D63746BCA
	for <lists+freedreno@lfdr.de>; Tue,  4 Jul 2023 10:25:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 683AC10E2B1;
	Tue,  4 Jul 2023 08:25:53 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5221E10E2B1
 for <freedreno@lists.freedesktop.org>; Tue,  4 Jul 2023 08:25:52 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-51d9128494cso5013488a12.0
 for <freedreno@lists.freedesktop.org>; Tue, 04 Jul 2023 01:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688459150; x=1691051150;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Gwa9ayC7Ak6RXmEufOqadJR2qAcIK0aMmR7v8FlPPcg=;
 b=CRPRH2PyUYCZ1jK1Qc0h/9aUTyNGCI7F1DbFRKdNYEJzxiLghWmBvg2uQxeUayOqFP
 faWZ0F5v21L53zpq36yVs/pIuqDnnDVjIakPoMMtwPQbRUxUOqcrd6XKAQp8pp4xkGWa
 65onm1TjV2PwfEWnJbSi6tTnqFMCXzkFtgLjh+scy4eW3ZXS5ZnwKlwWrFtoqkwVlSSn
 tG6pZeLXUJ1ajbuUYW2VKt6l/XzX+PborZGxViE8jZZKVDS7eJBohEW+txOVmLAoFBnq
 djLy9h4thHI27b80+l+Zuuk3VK0dJlWt9Vd4kuMJhYlda1hCqf6OBNbYbZENs7zCMZIi
 NAlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688459150; x=1691051150;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Gwa9ayC7Ak6RXmEufOqadJR2qAcIK0aMmR7v8FlPPcg=;
 b=MSYD2x/nSc7HAAt3P0BMO0XUx363kC+fXdga4374UFJNkubFYi0FhWnODNpRvPV/J1
 4JD5JqKjnSdPMifsaUbv77CyF7Ddxdye/jy/dz+FKu2Lj62qNgNH66R2eV7zO5btO8sG
 Hpqo69LFO0wpKrhS+yTY72NntbbjybqYcM3yQnD9DbbLaAWDA8mbZWRGQqr1NLlKBhul
 fz53aFbl2ijMYohIfkTYSupIq8fC1FX7TFbJdTCO4v5alI8dj1jp54VM4DvcvsgC7RHQ
 sVPGOwVp7uEgFe7CfA+0tQ0HgIOZc2XGTmABy77hnAvd96UVPRKW9WvukBuNS5n0EZq+
 wjJA==
X-Gm-Message-State: ABy/qLZYiWWeTJkcX6kXZuOQ/ECO6JAcHUpEJYsGibNGqrry5wdbrAL3
 nf2xt8s/QltKF1YbwgGwV8k8sA==
X-Google-Smtp-Source: APBJJlHmgyzlsuarhw/Jt8z/t9Vhtcu+0imkXk0L/rtTWGMWw+BjO//QTPgqUJNNXVge1SpoIsgC8w==
X-Received: by 2002:a05:6402:4496:b0:51d:d41b:26a5 with SMTP id
 er22-20020a056402449600b0051dd41b26a5mr9166945edb.14.1688459150303; 
 Tue, 04 Jul 2023 01:25:50 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a05640203c400b0051ded17b30bsm5493120edw.40.2023.07.04.01.25.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jul 2023 01:25:49 -0700 (PDT)
Message-ID: <05fde533-05df-a7c9-c36a-689e476f8c2e@linaro.org>
Date: Tue, 4 Jul 2023 10:25:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20230628-topic-a7xx_drmmsm-v1-0-a7f4496e0c12@linaro.org>
 <20230628-topic-a7xx_drmmsm-v1-1-a7f4496e0c12@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230628-topic-a7xx_drmmsm-v1-1-a7f4496e0c12@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 01/14] dt-bindings: display/msm/gmu: Add
 Adreno 7[34]0 GMU
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 28/06/2023 22:35, Konrad Dybcio wrote:
> The GMU on the A7xx series is pretty much the same as on the A6xx parts.
> It's now "smarter", needs a bit less register writes and controls more
> things (like inter-frame power collapse) mostly internally (instead of
> us having to write to G[PM]U_[CG]X registers from APPS)
> 
> The only difference worth mentioning is the now-required DEMET clock,
> which is strictly required for things like asserting reset lines, not
> turning it on results in GMU not being fully functional (all OOB requests
> would fail and HFI would hang after the first submitted OOB).
> 
> Describe the A730 and A740 GMU.
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

