Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1BE6E9F46
	for <lists+freedreno@lfdr.de>; Fri, 21 Apr 2023 00:49:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2388A10ED26;
	Thu, 20 Apr 2023 22:49:08 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7443F10ED20
 for <freedreno@lists.freedesktop.org>; Thu, 20 Apr 2023 22:49:06 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-4edcdfa8638so970075e87.2
 for <freedreno@lists.freedesktop.org>; Thu, 20 Apr 2023 15:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682030944; x=1684622944;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fdP8MC3XaEqA32rWPdIckKxRCI4GJxh3IXEDH13XKh4=;
 b=Uo5s2ZVJ8f0YtJNR2V/QAw9DClxjdNn9cqFYEbfOZQUbcrDWvI3kZIG/ZvuvSdVhU7
 pfh5B5a9RphGrqWEwNIRlbMY45cfKU38pWY1e0FY61FUJh0Jb1svYJ9R0LJakfx9tu3m
 nbekIr7F6ZW68EnD6s+zO6qcATzgxFBHn6w9fyAO0JcooAsehyLQcDBDOcntPm0NyGoN
 Oifnhlo7c89uxuHM+wDtJ0RnSGZNiKDCUdarMsAhcx8sziEmaqPjUGiTtCmM0BS8tN6v
 sj4Ln9lcUStQlwf/nzgnSZ0qMbfnh5CtcwwFPN++psWNdyfLRUKvJWy/6+3gbGTZVDBk
 ty5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682030944; x=1684622944;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fdP8MC3XaEqA32rWPdIckKxRCI4GJxh3IXEDH13XKh4=;
 b=W2VMKj7bSp4muwvOEhcNFxekMAwEZ/kmhp2ZlUER3JLScsLI+b58AocZE7txnAMB/E
 O/ihSY2cMXnuR+D58HPrL1lbuqZ1bnsTRwXB4ZQKOqoBtYBwU0cstcMyjvqmITBvySXF
 IZmimg+6DPta2lebA17M4fYqI/VKhWMA/L3hg64qV6vkkMQ/WgK130KD1d0ncx9fJYB0
 LbmbChAdrnOb5AESeeF0ue41avyooqJ0d9NkTQ+LRHNgpkDl7hsisjEyltGRhl95VSky
 +XqutYCZzrPAauJrNt73FQmpBMwptetrF68/bBRsdhLJXvKv+QVrrzdW/ladHireKQqA
 8RAw==
X-Gm-Message-State: AAQBX9dtYB2/ER7t64p5CRI2Ql2TBOZYGnvFq87Ok6Pnp8QZw6lYPOKY
 7EgO+jwFlOi6yf3CAiN2s40/uw==
X-Google-Smtp-Source: AKy350ZInjPaVxyUTYhwDYw+L3xY8vOz8c952eS4vzPQ6cipzNOj58Pw/XifVqqdE8XeIyyL0HzukA==
X-Received: by 2002:ac2:4905:0:b0:4ed:c9b0:6a42 with SMTP id
 n5-20020ac24905000000b004edc9b06a42mr780084lfi.12.1682030944156; 
 Thu, 20 Apr 2023 15:49:04 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 x13-20020ac2488d000000b004ef11b30a17sm94609lfc.91.2023.04.20.15.49.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 15:49:03 -0700 (PDT)
Message-ID: <d2b6ebad-dd38-0bb3-7c98-27cda45c7ed9@linaro.org>
Date: Fri, 21 Apr 2023 01:49:03 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, Will Deacon
 <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>
References: <20230411-topic-straitlagoon_mdss-v2-0-5def73f50980@linaro.org>
 <20230411-topic-straitlagoon_mdss-v2-10-5def73f50980@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230411-topic-straitlagoon_mdss-v2-10-5def73f50980@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 10/13] drm/msm: mdss: Add SM6375 support
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
 iommu@lists.linux.dev, Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 21/04/2023 01:31, Konrad Dybcio wrote:
> Add support for MDSS on SM6375.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/gpu/drm/msm/msm_mdss.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

