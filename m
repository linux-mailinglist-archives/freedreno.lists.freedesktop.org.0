Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C75297D892C
	for <lists+freedreno@lfdr.de>; Thu, 26 Oct 2023 21:49:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8340110E884;
	Thu, 26 Oct 2023 19:49:11 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C41EF10E883
 for <freedreno@lists.freedesktop.org>; Thu, 26 Oct 2023 19:49:09 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2c503dbe50dso19303691fa.1
 for <freedreno@lists.freedesktop.org>; Thu, 26 Oct 2023 12:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698349748; x=1698954548; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yQo5Ygp/VQo91WmeIUySmja/g+dCMkIYU04Du3vd0v8=;
 b=KZpSPL3dwY7g1l00lKjYfxqCtd42hsRWidmihcejxaHAar7+GGpY+9bN49Rl//u50z
 Ne1FsaVYKRVczDxx2pz4mIsYP08fr17CxtlUZjJ/2JLarmeNBfmGgzzoA58nGWWGFAKn
 ywM5/SibcctJov1GGJiIvO9gL7MjgnDITBobWxwwr/UKkFRD+zL9Zg6//9JsIbK1rpfa
 mbh11kXj9qSo99we7EzJzE2kYAJiYdosI0JFTQGGuqzVX9o7U70ecpf4L93+gf6xBM6r
 loHx7E1WU/dD9Jzan8tpH7kubLHISpwfVPaU/Ikw60TC3786hQtDVZ+ir6+irTproDdf
 im+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698349748; x=1698954548;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yQo5Ygp/VQo91WmeIUySmja/g+dCMkIYU04Du3vd0v8=;
 b=hInmlI+bW78BT7LScDg+qumZsI8Ymir1XC29Zfo5d/mYTAVJ9QsW+5IugDwE+vQ/12
 vdI7uAP5aWg2UOF8a4oW5YOcx3nD9QipykOJQF4tjxSlfPUdg4Sh+IYDlSGDP7QPtqC+
 FVmjEDZfPvqELLVngQ8JbxKvfm3aRZWtDakg422yPegaTNdFXOZA+7E95OJGc1Aq0hZO
 L4cOFafzWiMzkMOQI5Q8NCleIk/C/wIFuHQd7YPuVYHSRAREo5LAl5PBrvRUvx2P23SP
 E90vgzUDKZJRPoH0pK10ZUWb8tZcJ6dEEcwV0NqPPZTR8ChXZ+kPI9tX+9L0YGuL0kS8
 z/kQ==
X-Gm-Message-State: AOJu0Yw5nX+wC5WTYL2AHWi+IqXtiWC4YXJPFKSa912lpvU/Z2UgonlH
 bndFkTkVqAR57os1hR3Sgr2UQA==
X-Google-Smtp-Source: AGHT+IGgTfzLPhO1//xaSTpCa7fs+zQz0fBWXc3bke1iz6X06ZDQRa5OfdLN69OUvgixhEZ8/69lYA==
X-Received: by 2002:a2e:a228:0:b0:2c5:462:3048 with SMTP id
 i8-20020a2ea228000000b002c504623048mr498548ljm.1.1698349747935; 
 Thu, 26 Oct 2023 12:49:07 -0700 (PDT)
Received: from [172.30.204.123] (UNUSED.212-182-62-129.lubman.net.pl.
 [212.182.62.129]) by smtp.gmail.com with ESMTPSA id
 g17-20020a2ea4b1000000b002bcdbfe36a1sm3014040ljm.84.2023.10.26.12.49.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Oct 2023 12:49:07 -0700 (PDT)
Message-ID: <858f06a4-fe18-477d-8366-6100bfb24702@linaro.org>
Date: Thu, 26 Oct 2023 21:49:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, Vinod Koul
 <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>
References: <20230928111630.1217419-1-dmitry.baryshkov@linaro.org>
 <20230928111630.1217419-11-dmitry.baryshkov@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230928111630.1217419-11-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v3 10/15] drm/msm/hdmi: correct indentation
 of HDMI bridge functions
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
Cc: freedreno@lists.freedesktop.org, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, linux-phy@lists.infradead.org,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>



On 9/28/23 13:16, Dmitry Baryshkov wrote:
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
