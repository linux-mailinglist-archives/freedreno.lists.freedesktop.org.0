Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7263CA3232D
	for <lists+freedreno@lfdr.de>; Wed, 12 Feb 2025 11:05:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A8C110E837;
	Wed, 12 Feb 2025 10:05:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="xHA0pJx0";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3D7010E1C1
 for <freedreno@lists.freedesktop.org>; Wed, 12 Feb 2025 10:05:56 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-545064389d3so4159208e87.0
 for <freedreno@lists.freedesktop.org>; Wed, 12 Feb 2025 02:05:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739354755; x=1739959555; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=rVn+uPBQWQ6NpvoZYnq/I1sJTX4u55kbRPPlDvjT25g=;
 b=xHA0pJx0ixdVCQRzsp0hbzZrNH2ndglRINl+yFKKaYZ/dSEPBFmVHoTYXSsmOGu6X0
 f/yg/VI+K9/Cz46OCWu723Hiwo6Y+qC+ttiEaonyQo+Fe59wqPgthQPoOaO7PV3fQPVX
 TWtizv5bRmkZXK8W88bEEPyezlaYcaDAn11skJwxf0x+yymaYd1zzmdwLE2nVWzbXtfL
 RrmW5L82CxnN6J3eIfXawLjDqezdAYs4Jk6V85gVhSSaJJdTBJETEnRGdkrjVYfFgs9u
 UAy1JBN3ga1dM3JNhLZdkl9ARmK3S1KfkFqw97gvrtuuakjbGdzB25LvK2iv+JjueWEA
 L17w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739354755; x=1739959555;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rVn+uPBQWQ6NpvoZYnq/I1sJTX4u55kbRPPlDvjT25g=;
 b=ChTY+i7OJVqBbbDgmAavOcr6bKURXDFveIWFEQHhIQz2OHxPtOYfFkCpbJ4gaNFfZ+
 kDGNIyvEOErqongJ6Wbcz4XlkaSFssdoIGyDXEmr9pIR2pfIDestJyK9h9uH4IeiF+i2
 u8xTSACx+PlnxDBWICcSlTg9teqmzpnGZL7uuf3UBqbrhO3mjID3NrvPg1rlOmZ7C3S4
 AQ4T7dwWPvnuuNzV4OCzrwBFkMCOnF7hYPA5wfJv5RCDYNhaQQhG+vv0r0N25uK+PMEo
 qK6CyGNYEl1PibGUV+qYl9mgmliIhnCZ4j+Qhe0pbGSd920GGUdzwM7PknwA7IcN8hXo
 pkjw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLrw0Wphnq4LVlf6VjNFdnsQy1l88/WbDoza5Qv1purPxSrV7NhQH2DmqkKcOvYtbvY4U4+N5no+Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxrsIrvJoZhkts+Hg8lcfK4GItAxV6K9TRidGae9bTqykCJ0drI
 o8zMvep00Q2csE+JEuaMos3fBE6oWp9l06g0aXePUYNIwkZEwuwgTcOnqi8jiIM=
X-Gm-Gg: ASbGnctwrN6F8ilwu9DuuudiZn8iUD+9TUIiQ5HITmk9lc7S5zUzjI9wVBFvmTjdB1u
 7Dd9fUbn/TbRPxB1beukdMKVU8UM9OkCcTp+fkisX7c7SCJ2v+wWgUpIYAjxGi6Kwm4jg9Ja1i5
 i1go03sUZbf4Amu16Ggte9SdNK6eFc83SCCItSiyBU/WP6IJe3+JZzmIoliDXiUjaumre6oOTAv
 FrDfelDIqp2TQ77+vjdzio9eqjVFBG+tQT1cGKcD8q20U+1geilcexcyTSVAYbGZCuko43Gurtf
 23qQ1NgVrJht6Gys//hMZIRIZ9ce1WB7fWoCemy4b2dqdnlGtIWHGoxh/W2/9QUqLyZ/o1w=
X-Google-Smtp-Source: AGHT+IFcCCjr2F4j57iyCku2KMNTSNmgSM7kl23BAa4v+symeaOyRKmfomba9eHHUlGd0C+dHbaR+A==
X-Received: by 2002:a05:6512:3c9c:b0:545:bda:f0d with SMTP id
 2adb3069b0e04-5451815a1ccmr746030e87.37.1739354754502; 
 Wed, 12 Feb 2025 02:05:54 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54410555a3csm1825349e87.78.2025.02.12.02.05.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Feb 2025 02:05:53 -0800 (PST)
Date: Wed, 12 Feb 2025 12:05:50 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Yongxing Mou <quic_yongmou@quicinc.com>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v4 3/4] dt-bindings: display/msm: Document MDSS on QCS8300
Message-ID: <emfd4gqstixawba64mywtsitbek5srrekoute3hjudi6xhfjhl@7ndrv3ua7uei>
References: <20250120-mdssdt_qcs8300-v4-0-1687e7842125@quicinc.com>
 <20250120-mdssdt_qcs8300-v4-3-1687e7842125@quicinc.com>
 <e620e80d-afeb-4ce1-9798-2f5cdd92b3b1@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e620e80d-afeb-4ce1-9798-2f5cdd92b3b1@kernel.org>
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

On Wed, Feb 12, 2025 at 09:38:07AM +0100, Krzysztof Kozlowski wrote:
> On 20/01/2025 04:49, Yongxing Mou wrote:
> > Document the MDSS hardware found on the Qualcomm QCS8300 platform.
> > QCS8300 use the same DPU hardware version as SA8775P, so we reuse it's
> > driver. But QCS8300 only have one DP controller, and offset is same with
> > sm8650, so dp controller reuse the sm8650's driver.
> > 
> > Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> > ---
> >  .../bindings/display/msm/qcom,qcs8300-mdss.yaml    | 244 +++++++++++++++++++++
> >  1 file changed, 244 insertions(+)
> 
> Also wrong compatibles used.

Which compatibles are wrong here?

-- 
With best wishes
Dmitry
