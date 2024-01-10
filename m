Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A5B8298FF
	for <lists+freedreno@lfdr.de>; Wed, 10 Jan 2024 12:27:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE67510E733;
	Wed, 10 Jan 2024 11:27:14 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D2A810E5C7
 for <freedreno@lists.freedesktop.org>; Wed, 10 Jan 2024 11:27:13 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-50e7b51b0ceso3795813e87.1
 for <freedreno@lists.freedesktop.org>; Wed, 10 Jan 2024 03:27:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704886032; x=1705490832; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=z8fqLJGB4BORM/e+032bZk6rSSH31yu0kVoWo4ILNqA=;
 b=ZVvjmBFuodxUe4Gl74JFbo0FOwY2IyqYMBzTJn1xExdrBJW3kxPgSDoIh3TH6yzD5E
 MxS5XQVfWGc1jtyAE//qLmj/HdoR7w6CslhrNrDUlDDnTuoXCNL+ktELEpfOLPoz5fbr
 W8iO5uXDPeUtKDxCbo0BaRJ7n1dIzRq/v+vIOV19cmz/COixb2wlkw03jdZpPEecyefs
 /TUU7srgIDTK1ols2X2yHvOW7iHA1wmvG87lr275KARofwkPFIumDz1tjRBBWuJAyek1
 4pa/aPXeum8U19P+gjSuKAxc4W5MoiY0m5PqQ1iBmLzrD4O7Rhe7kDW7Uef8VtR0XmSL
 GWhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704886032; x=1705490832;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=z8fqLJGB4BORM/e+032bZk6rSSH31yu0kVoWo4ILNqA=;
 b=mdN7ut2oBVpupxTo7F7XKLjHsAjGODyPGr5pkMQFEYuGlP3F1P061vBCPEXPmTlWNY
 tmMFBiG2uURtg5wxQW/OGm1fTy6KoOba1Bm7JoJj9/a34FYhUgGamtfmqeh41Z4cNPlM
 bbO1uO1tRY3rhItk9Ml7OfAX1+326kE2nxaq9FAdTI9LsBDCFBU/XJPQ5kbt+gVBq7NE
 8C6FL1niRLWpfSvaQbtxYSaeaEaroUELrunYGX+sgCe/LziWrcmLgSuKgrVuRQSnkgvc
 QSEHmEmuzaFvUdY7QxiH4d/jFqY/VNhnXwfm57wOu9yKnPZjFVYWZMmntNL2TaStpDCc
 N11g==
X-Gm-Message-State: AOJu0Yxaz3n07UozGnDFr5nrpaUWwS64R+EPuhg6D33S+a+9/RkIfM8k
 cWFJGIYiH7v9dGIipYHmcTz/MMCGv0kUZg==
X-Google-Smtp-Source: AGHT+IFMzQJGktOuWmBl23WHZe2kgD5663wQfDGQ9NlnRH8dRYMaZKwgzVMCv8dUK8l/Na8BqMxgrg==
X-Received: by 2002:a19:6453:0:b0:50e:a436:aafc with SMTP id
 b19-20020a196453000000b0050ea436aafcmr333897lfj.9.1704886031779; 
 Wed, 10 Jan 2024 03:27:11 -0800 (PST)
Received: from [172.30.205.119] (UNUSED.212-182-62-129.lubman.net.pl.
 [212.182.62.129]) by smtp.gmail.com with ESMTPSA id
 x8-20020a056512046800b0050eb7941041sm632908lfd.297.2024.01.10.03.27.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jan 2024 03:27:11 -0800 (PST)
Message-ID: <0c77e014-9f08-44ac-9495-eb2a8afaac80@linaro.org>
Date: Wed, 10 Jan 2024 12:27:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/15] drm/msm/dp: drop dp_parser
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Stephen Boyd <swboyd@chromium.org>
References: <20231231-dp-power-parser-cleanup-v2-0-fc3e902a6f5b@linaro.org>
 <20231231-dp-power-parser-cleanup-v2-15-fc3e902a6f5b@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231231-dp-power-parser-cleanup-v2-15-fc3e902a6f5b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>



On 12/31/23 01:44, Dmitry Baryshkov wrote:
> Finally drop separate "parsing" submodule. There is no need in it
> anymore. All submodules handle DT properties directly rather than
> passing them via the separate structure pointer.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
