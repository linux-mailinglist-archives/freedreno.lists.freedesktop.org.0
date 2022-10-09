Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 200435F8D8D
	for <lists+freedreno@lfdr.de>; Sun,  9 Oct 2022 20:55:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C49CA10E067;
	Sun,  9 Oct 2022 18:55:55 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 379A310E067
 for <freedreno@lists.freedesktop.org>; Sun,  9 Oct 2022 18:55:52 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id bp15so13822565lfb.13
 for <freedreno@lists.freedesktop.org>; Sun, 09 Oct 2022 11:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qH4ZdZe+x9C/mI7GHILlpyuEO7Jb1CNK+ic7+GHbAPg=;
 b=U67pc2OnzYA36zslKIYqtHiPcMCpSF7wMvMSO3Ncc7e7XL4rSnYrEgUVrEq5SVQ3Jk
 uK9TEAAsUiahgTYMsFuMpELEL3XYe1l1WY4z7K8NtsVsxGL7kjDBGRSZS622q3mb5vrK
 bFtZI96xetuaJyGuSbGpTMzg1sWCiBdqiJX7ifEXJ/NW8yldlwsFFwncDIutLsMQFFIA
 9A0qENGe9B0nTnApk7TRWE4myDf2aK20z5RQ0McOfYvLuURpLcy7rrFc1hQJqBPu3YxO
 ppd1k+MPhESgcA/+n31BW1JR6etJ4e/nWL/S09r9Oyn+ppQEJwhEPcbmkhAs4lcoNuEr
 H9ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qH4ZdZe+x9C/mI7GHILlpyuEO7Jb1CNK+ic7+GHbAPg=;
 b=pYwTiew4jl0kLmtIhXxFEvf5MVRPIUN/C91f6I6raKJlcnF70EygjESo7l83KK34Rp
 Jkya8IrdfXjLPxSuPBtriCdpRb5Q2LGKzOp9sj9VUv5tCueK8TYlDXBaJQfFexo5aok8
 r9eLsDsSqSkBwYRG93ytWk+VAstUcW7nhQt/A4xW+koPzEQXlAb0Zn4US1I1wnfby6UG
 39QQ4CaahNzXOrh/PmXsl15suFjJwVS8u6kipYsi15wRNYJagmedEZ4pwER08uXHrUf0
 MdvfTGyw9gt5Damiitm1k8HYZwwUkHF2712lGKLdNnfHRz8eNNNWngyrRgevkz9RmbhQ
 AAJA==
X-Gm-Message-State: ACrzQf2tG5F0j5R56Qy5SU73yodKYdmHY1GLzLgNST7tkFSbvp50xCws
 Fi4pP73Zt7zLjqbQIYW2yxbwcw==
X-Google-Smtp-Source: AMsMyM5XudCQ8+NtBNRpwa0An+WQMISOz2GaDYRpbDg8sJiqOjSyAFsOtplF00BqphiaiAFA/WnMKQ==
X-Received: by 2002:a05:6512:6d2:b0:4a2:4f62:270 with SMTP id
 u18-20020a05651206d200b004a24f620270mr5064072lff.143.1665341750545; 
 Sun, 09 Oct 2022 11:55:50 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 h15-20020ac250cf000000b00499b27a329esm1108791lfm.300.2022.10.09.11.55.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Oct 2022 11:55:50 -0700 (PDT)
Message-ID: <a36325ea-b1a1-4137-97c0-a76ad72a7c87@linaro.org>
Date: Sun, 9 Oct 2022 21:55:49 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>,
 phone-devel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Vinod Koul <vkoul@kernel.org>
References: <20221009184824.457416-1-marijn.suijten@somainline.org>
 <20221009184824.457416-6-marijn.suijten@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221009184824.457416-6-marijn.suijten@somainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v3 05/10] drm/msm/dsi: Appropriately set
 dsc->mux_word_size based on bpc
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
Cc: freedreno@lists.freedesktop.org,
 Jami Kettunen <jami.kettunen@somainline.org>, David Airlie <airlied@gmail.com>,
 linux-arm-msm@vger.kernel.org, Vladimir Lypak <vladimir.lypak@gmail.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Daniel Vetter <daniel@ffwll.ch>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 09/10/2022 21:48, Marijn Suijten wrote:
> This field is currently unread but will come into effect when duplicated
> code below is migrated to call drm_dsc_compute_rc_parameters(), which
> uses the bpc-dependent value of the local variable mux_words_size in
> much the same way.
> 
> The hardcoded constant seems to be a remnant from the `/* bpc 8 */`
> comment right above, indicating that this group of field assignments is
> applicable to bpc = 8 exclusively and should probably bail out on
> different bpc values, until constants for other bpc values are added (or
> the current ones are confirmed to be correct across multiple bpc's).
> 
> Fixes: b9080324d6ca ("drm/msm/dsi: add support for dsc data")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

