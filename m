Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5F29E1E80
	for <lists+freedreno@lfdr.de>; Tue,  3 Dec 2024 14:59:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5650410E47A;
	Tue,  3 Dec 2024 13:59:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="HpLumwtk";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1232810E47A
 for <freedreno@lists.freedesktop.org>; Tue,  3 Dec 2024 13:59:00 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-53de92be287so8238181e87.1
 for <freedreno@lists.freedesktop.org>; Tue, 03 Dec 2024 05:58:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733234338; x=1733839138; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ratoXWp/EmolcxNUAUNGQ1kmRPcGIDYTBbsytoKVT70=;
 b=HpLumwtkdnyMDrp/OzbJgs/LjMnyOWRoNadhBgG9LoMhhzVm0FjrV9lM+R6z6mYdXw
 NoLngG5qu2Jo37Csotlb8acwrfyUuyXNorArxdOt8xuNY6T9pj4l1vmYIVhbPYGQl6pt
 plmrIxRWD9jLXw1bvGc0UW5Nty/4Cc+OEVA8WweghahSIHb59lWsHUnSA018sthi5xFq
 v7XOet8kJ+JFJ86r+R5+jluFgoSiOeQyrabzeC1iyMWpO0aCnS1BcdYF0xtGoas7uBok
 /EZeZGVDj7JPxx6VOv/S4s+1XjeSeQAREEliIh8QnmCfC2vpCTDOqNNaWk2as+JRY2vd
 YJYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733234338; x=1733839138;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ratoXWp/EmolcxNUAUNGQ1kmRPcGIDYTBbsytoKVT70=;
 b=oWK3emwoSb/0DcA7x40iUTMDEkbiJyYP//tgGxFmmdwj9htOrQJrJfCUJw5sVX6rUr
 CCOiXq5IwHm4Cv0IDCztMC6zbkIK2+ldp9F7Hw+YOdjucz6XpDvi6SdP7nmYNcYIp3W6
 Ff8edt7rz3LfIolvWcb5Df9buADiAH0ADJ0pssmldzN1uT6LBho3Ed246HhZwzs/bFy6
 ZH0qahAiCierf1cktouHfI2yRnPwLhZpnkTh745IT5hqSOmkIcA4tbctzfCfY356FteZ
 JLU/sz9jhwVecCb0qV1IrTxUM7+9NbhVe6W8tnDf3q3/dyGYxHJo1OFGrJG3urLIE4b6
 L68Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXUTpNpmaItyCkoV7vsqw8efVFCQ48zjQQGz3a1AkZHGUJyGCu/swRGltmZwjG0zPt47fqqpuPktzM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyatR/aBQaejeLdcZwl/vLA5yRJ/Wzp52igmd8FFnkpjvp1Xn0X
 mbzPLECn5ED6M6JK7Tt9n6x6O42f9pP+2gL4J9DBWcnGqQgLnVIF//IKxy9J0jM=
X-Gm-Gg: ASbGncvN31Otd2uOg8/29l/4YzIWybMUFhPuPZwEyqMfhoERFmB+sAChgM9bYPY5hTd
 HbKUCVcrlPlmx3faoVo7mAKtQ77FuxIL5d1VUqaFt4S/sRuGk/AivtnvcAr00Hpr1SzrOlpvjNj
 c+584UATCiKYWdJAnFJmpjCF1eSeQeGa2BH8pbcKukQ7ihs+V31BfZ5SQLDO04s8boPFAsx05kP
 ccXL8n/WEV4hAge2NGpoYPa5N1FGe8s3+jngDoYho8xJsvdMlhIy0zue1IOJhwFfyN/mVwKJGkQ
 2mIxReHIUsNFmOnuE3gHi4/TmtcNMA==
X-Google-Smtp-Source: AGHT+IGXwu7iAMc0T7nz4ZWr7DVCTldVmrbcWesEg5VeYru0HhyDfTDMH7KA7Bk8Gf9p7i1oKm3lyg==
X-Received: by 2002:a05:6512:3182:b0:53d:a025:1142 with SMTP id
 2adb3069b0e04-53e12a39336mr2285402e87.54.1733234338202; 
 Tue, 03 Dec 2024 05:58:58 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53df64a06fesm1843812e87.258.2024.12.03.05.58.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2024 05:58:56 -0800 (PST)
Date: Tue, 3 Dec 2024 15:58:54 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Xiangxu Yin <quic_xiangxuy@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, quic_lliu6@quicinc.com,
 quic_fangez@quicinc.com, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 6/8] drm/msm/dp: Add maximum width limitation for modes
Message-ID: <fb6enh3wzusadc6r7clg7n7ik2jsucimoi7dnecnsstcz4r6e6@dtahvlm522jj>
References: <20241129-add-displayport-support-for-qcs615-platform-v1-0-09a4338d93ef@quicinc.com>
 <20241129-add-displayport-support-for-qcs615-platform-v1-6-09a4338d93ef@quicinc.com>
 <CAA8EJpprTGRTxO+9BC6GRwxE4A3CuvmySsxS2Nh4Tqj0nDRT_Q@mail.gmail.com>
 <95a78722-8266-4d5d-8d2f-e8efa1aa2e87@quicinc.com>
 <CAA8EJpo-1o9i4JhZgdbvRxvoYQE2v18Lz_8dVg=Za7a_pk5EDA@mail.gmail.com>
 <86b9a8be-8972-4c19-af0c-da6b3667cbf4@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <86b9a8be-8972-4c19-af0c-da6b3667cbf4@quicinc.com>
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, Dec 03, 2024 at 03:41:53PM +0800, Xiangxu Yin wrote:
> 
> 
> On 12/2/2024 5:32 PM, Dmitry Baryshkov wrote:
> > On Mon, 2 Dec 2024 at 11:05, Xiangxu Yin <quic_xiangxuy@quicinc.com> wrote:
> >>
> >>
> >>
> >> On 11/29/2024 9:52 PM, Dmitry Baryshkov wrote:
> >>> On Fri, 29 Nov 2024 at 09:59, Xiangxu Yin <quic_xiangxuy@quicinc.com> wrote:
> >>>>
> >>>> Introduce a maximum width constraint for modes during validation. This
> >>>> ensures that the modes are filtered based on hardware capabilities,
> >>>> specifically addressing the line buffer limitations of individual pipes.
> >>>
> >>> This doesn't describe, why this is necessary. What does "buffer
> >>> limitations of individual pipes" mean?
> >>> If the platforms have hw capabilities like being unable to support 8k
> >>> or 10k, it should go to platform data
> >>>
> >> It's SSPP line buffer limitation for this platform and only support to 2160 mode width.
> >> Then, shall I add max_width config to struct msm_dp_desc in next patch? for other platform will set defualt value to ‘DP_MAX_WIDTH 7680'
> > 
> > SSPP line buffer limitations are to be handled in the DPU driver. The
> > DP driver shouldn't care about those.
> > 
> Ok, Will drop this part in next patch.

If you drop it, what will be left from the patch itself?

> >>>>
> >>>> Signed-off-by: Xiangxu Yin <quic_xiangxuy@quicinc.com>
> >>>> ---
> >>>>  drivers/gpu/drm/msm/dp/dp_display.c |  3 +++
> >>>>  drivers/gpu/drm/msm/dp/dp_display.h |  1 +
> >>>>  drivers/gpu/drm/msm/dp/dp_panel.c   | 13 +++++++++++++
> >>>>  drivers/gpu/drm/msm/dp/dp_panel.h   |  1 +
> >>>>  4 files changed, 18 insertions(+)
> > 
> > 
> 

-- 
With best wishes
Dmitry
