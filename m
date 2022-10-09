Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1855F8D88
	for <lists+freedreno@lfdr.de>; Sun,  9 Oct 2022 20:54:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0688510E067;
	Sun,  9 Oct 2022 18:54:58 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D805710E543
 for <freedreno@lists.freedesktop.org>; Sun,  9 Oct 2022 18:54:50 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id z15so3366982ljq.11
 for <freedreno@lists.freedesktop.org>; Sun, 09 Oct 2022 11:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HfHIwCu6ix9Kna+8PuTHr1cR5KLg2VwjNd612N/VBhk=;
 b=icnrUwOEYqqXpM7lGG58XUOx4f2Lfbh+szDyq/Oe6bhXj/POCjjfWnVv56wQN0iwsJ
 E6g1tPHS1qRwPYcYRhrBJ2Yxk1F+p+9FJK3NV/dtSPE05H37fPv7KlBx9pYr5hhzn2i7
 KHh1zgLVPLyORveVb5L0CmFIzIo/GE2OjHF96QOJRzKH7W2E2MgHYhghbtizM+z5Gw50
 Ivz/RRcDmG2BmoELfTXehCmSD6lD5ipKIPLIjVlHHPFpHhJ9b0aLqTwsX858zhDkixxx
 j7kk/FEInm/WizXGsyU3JE1SDukQxNXNxQRM5BGqUGwl3PQYuFBQnzwdoptCVfX40AaS
 R3Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HfHIwCu6ix9Kna+8PuTHr1cR5KLg2VwjNd612N/VBhk=;
 b=NatOx19ShH7xnMiOKD1tl44fFGQ0nrsm77NM4idTB9EB9V4WFr4ljUGUxdN/lgj5vp
 dbJE6UK3BokPfXz2NM+EhaUWJVpqK+voqYmfNIT3OcLDbntZNEBcS6xJx76BMO0AmrNP
 +06kk7BH0Wnxcpqdk7CT6uBkTkFpz2B2NL/BIPUIChGOOFw13aeGzc9B4WSz07XXi2VC
 DvZ91ZIcrj5AtXqNv0eWbexrsyv5o5V6ZRiO44jvvm9IDj50JDrfvKlZ43jxE9fFBHac
 QAq6VvE8paP4mNMkH/EQr3UDwgOoPbbcqm8xMkFSZ+sgLrl5ajzwyEENrtXK68xxS6R5
 TEnA==
X-Gm-Message-State: ACrzQf0w5eO/MiLjCFzSfZCNaSDbrz0pOGJ/YCA8Vnt3OX45soPi9dKi
 7/suKOWFRfW6BKsPLab2yEOoBA==
X-Google-Smtp-Source: AMsMyM6CRg4uBwxkS7rjTe5Yf0/rhGdcCtjAb5V9AqMemVPwKziC/xVhAt3f7dUbsd0ZGixqPW5KAQ==
X-Received: by 2002:a2e:9f51:0:b0:26c:3db9:3660 with SMTP id
 v17-20020a2e9f51000000b0026c3db93660mr5559612ljk.528.1665341689141; 
 Sun, 09 Oct 2022 11:54:49 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 g3-20020a19ee03000000b00494716e4f23sm1113741lfb.111.2022.10.09.11.54.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Oct 2022 11:54:48 -0700 (PDT)
Message-ID: <7b72e9bf-9736-59b7-7355-db6b1c643e85@linaro.org>
Date: Sun, 9 Oct 2022 21:54:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>,
 phone-devel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Vinod Koul <vkoul@kernel.org>
References: <20221009184824.457416-1-marijn.suijten@somainline.org>
 <20221009184824.457416-5-marijn.suijten@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221009184824.457416-5-marijn.suijten@somainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v3 04/10] drm/msm/dsi: Reuse earlier
 computed dsc->slice_chunk_size
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
> dsi_populate_dsc_params() is called prior to dsi_update_dsc_timing() and
> already computes a value for slice_chunk_size, whose value doesn't need
> to be recomputed and re-set here.
> 
> Fixes: 08802f515c3c ("drm/msm/dsi: Add support for DSC configuration")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dsi/dsi_host.c | 9 ++-------
>   1 file changed, 2 insertions(+), 7 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

