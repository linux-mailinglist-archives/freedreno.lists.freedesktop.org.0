Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1DC69FE22
	for <lists+freedreno@lfdr.de>; Wed, 22 Feb 2023 23:10:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1CAF10E412;
	Wed, 22 Feb 2023 22:10:48 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42B8A10E478
 for <freedreno@lists.freedesktop.org>; Wed, 22 Feb 2023 22:10:47 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id i9so11778031lfc.6
 for <freedreno@lists.freedesktop.org>; Wed, 22 Feb 2023 14:10:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=u4mYbzQ9cgwTl+69pCWin73Y2hlI6/ouh6GkkcpHJEs=;
 b=pGRGa8VHaQVYRZl+HXCExMLMBiULJptfRc2lr3kNFPsIf8JUa36WV+Xpf6lZS/l3vx
 yRPqSjVBUE9kMQEYWcpUUkNbys1JXsxmKoLRejio5ACOa5uT5AqMGx/VkSDq29Y0+AsY
 VUu0EN//vB6TBijnhOyeGkkuSbXwkYexekJgnOhf848VpyQR3HtSBsPfrHZqxFH60CP6
 ANq32REb17kzxwK8nS8UW6xxbS3PEiZr4fnJpoP4z9MrdjmkifAl4xHSwQ71dojEpwrJ
 9mmCs5X2cfnd1/LYCEoqMQRWxTICzqrADTrqkAGCBCJU7r/jvX0NxTg5xdKBchPiXv+5
 PjOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=u4mYbzQ9cgwTl+69pCWin73Y2hlI6/ouh6GkkcpHJEs=;
 b=qA1Mk8vr9KFImL301aJjXhP+nGA78bDzCVSI5YrjTR9WfXcnqN1vUK1gsKwobiQy0g
 PNUk2u1kXfloXD6SU0xQKD0vjcufKHW9vmhl7f7yTe5KwDMSqaUtb2Pne5WVei7H6OEQ
 l70w0vPx3ouuK3ko87eWSm+VcNcawEp3PjHdxolgxs71Xm4HUiwT3F3Ji9HOtTWVIg16
 huTgi8ODNcD6yPU90l4k2bBun3UUsm9Pj9myoMX+5lU+mHm8gqDX06ky6+GRXZZhIfF3
 SLkMKx9hJYx0oWcdJxsltxarab16OEPyS42XXqBHu+q6JAkfAGae/zuWD2Tog1ocZRJg
 hLVA==
X-Gm-Message-State: AO0yUKUmvzX5hTtpFe1RHrvpI7rMD/Oz55KKV5wc6kvzGmyxHtzcbhIa
 XHbWHGiG8aDSGlFDXmdICD/7Yw==
X-Google-Smtp-Source: AK7set/IjvGyF7xyCv2RYJe+CEGvQ2ntC7MMr1iIO9quNinHmQlwonGSpH/aP8ZV6jHrfpSv8T4MqA==
X-Received: by 2002:a05:6512:7c:b0:4ca:faa4:af15 with SMTP id
 i28-20020a056512007c00b004cafaa4af15mr3016648lfo.66.1677103845348; 
 Wed, 22 Feb 2023 14:10:45 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 q3-20020a19a403000000b004d869c1861esm2280873lfc.192.2023.02.22.14.10.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Feb 2023 14:10:44 -0800 (PST)
Message-ID: <628b480e-caa8-6230-6fe8-4cd582372afa@linaro.org>
Date: Thu, 23 Feb 2023 00:10:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20230222-konrad-longbois-next-v1-0-01021425781b@linaro.org>
 <20230222-konrad-longbois-next-v1-3-01021425781b@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230222-konrad-longbois-next-v1-3-01021425781b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 3/5] drm/msm/a3xx: Implement .gpu_busy
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 22/02/2023 23:47, Konrad Dybcio wrote:
> Add support for gpu_busy on a3xx, which is required for devfreq
> support.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> #ifc6410
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

