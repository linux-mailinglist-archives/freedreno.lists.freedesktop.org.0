Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80BB7AAEDDF
	for <lists+freedreno@lfdr.de>; Wed,  7 May 2025 23:24:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B31210E1C7;
	Wed,  7 May 2025 21:24:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="MAAqfIMx";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B101710E28F
 for <freedreno@lists.freedesktop.org>; Wed,  7 May 2025 21:24:46 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 547AtsOH021930
 for <freedreno@lists.freedesktop.org>; Wed, 7 May 2025 21:24:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=Yr3o+GPqvA0++Om8f862Y7z+
 HVP6SVMxvLd+HrwRncU=; b=MAAqfIMxuHYJYdUYpVdHhZJCUZLtl55kOtK1QEhk
 mFb7plCZbr/aiP15YAaRJ6VohldJ5PCA0vbc8LL0z1q/COgSe4q+erJdB3Th3i34
 jmhUdCmNc6udYtr9XphCY2pFDTxG7T6dskBDH2va0LB+KW0n0rsnUXX2HGdiMe3q
 GAi1RDCd3K3to0EShdPUFm5gQO7SZEvECXh7Wcy6+7RqXlR/Vz1HJjARnUuiZ6cE
 MiDcmIte5qK1KQhkEcj8ZP2J511sa2UsutB3Q0uCZNEKZcyDoZazRLq+9hmoE7Cr
 QpV2X07IhMUTS5hcJ6+ytSDne0RmpKZmARphcPn97N+QrQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46f5uuy7ap-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 07 May 2025 21:24:45 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c53e316734so43088585a.2
 for <freedreno@lists.freedesktop.org>; Wed, 07 May 2025 14:24:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746653085; x=1747257885;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Yr3o+GPqvA0++Om8f862Y7z+HVP6SVMxvLd+HrwRncU=;
 b=heFTeMSZ3tZelwr1HfqUCeoe1tlEZPixCKmkL+/jgaEDOQq9EeUJLXSjmZ4JUN40A1
 YPSMai/16Bsz5US1FK+Ytz++cry9gEWqYKMXrmJGroMWRTmpq6XkCnh2epat/C7nwaW1
 fhmZWOS1uosacO2OWtcP066+LdAjtNw185x0Qa7fWfANlBz50qa5ektpGnjzeu6DB6vO
 TU9U1k0Q1Fvtzh2HuDZHi5TxEsHVM8q2/l089b3MmTZ5gog7J3ensB5xBVexLENSvShG
 ZZvAnyIqhaXT/HhYQZHyg+DUcjsgXDegOrX30GRWspGS4RoPKLhAm0aXxiSsa1lhNzcK
 V4WQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWUEsJ9pQOUaCtOeWX0f3levMLqMr2TMPBHv9xMSVPExapYAiDleTg5KJrFBZ3Wybi2dadEknrHjqc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz+U+7QkdSDm9DeiQQcN0G8BxdSA06kevpIumxA6EwDFrlvQH3t
 U8KHpR1IIkvBSGGerxyL5VfZlSVSqhjn7R/Hqoghbz4EhpIWzG6PlNPM8DJ4oC5rqn1iQgFmqQl
 lSGBNbEUCxufPa+w+SBuh+ipPajwGDrbqD/zi43zYoRkFAH5q773Yg2APGWEb8B1j6Gc=
X-Gm-Gg: ASbGncswxpAMZ+9Bb5AWXrtMSF01n6KpMhWrAPrNhZmolLM6W3u9D0zD+4U4Jru802j
 4P3jy+tj3f11aFvYfLXLuqs7av+QCSHpu/HEwUchVdZ1QuUmW2/hXduTUF7Zvevlq0Lm6KiGiWT
 /5GTZLYR5i2A5USSNV61+UbPM8km8HzsMZSDRvOz6rC+Pzjd/J/a+uu+ylHUi2N77fZ2KDfnWAO
 BlR2KUfkclOQPEP6G4A5Fe0mJQ1L9OFSc38G1pbe6GNY0fd8mkO09BxtiDMpCL7BTzrEqbV105O
 EhSAcjhQMTuzXznfeqR7kOizE6TazccRTi56kn1SXzuGm4zD/8v4N23mvDza1cfoJqgUh7txYqE
 =
X-Received: by 2002:a05:620a:408a:b0:7c5:dccb:fceb with SMTP id
 af79cd13be357-7ccf9ea54b5mr141179585a.56.1746653084973; 
 Wed, 07 May 2025 14:24:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGV+4FNkfuTlk4HKwK7ViJWDaszxk32pmkR7zSWKKmrIlnWNomLRPlCCNIKifiYiqB/AQHVsA==
X-Received: by 2002:a05:620a:408a:b0:7c5:dccb:fceb with SMTP id
 af79cd13be357-7ccf9ea54b5mr141174785a.56.1746653084505; 
 Wed, 07 May 2025 14:24:44 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3202ad90896sm23728941fa.101.2025.05.07.14.24.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 May 2025 14:24:43 -0700 (PDT)
Date: Thu, 8 May 2025 00:24:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: Re: [PATCH] drm/msm: mdss: use devres version of interface to
 populate children devices
Message-ID: <xmpb6zrbnx2jcfjthkafj6viptkugowo7qdfxlg7vdfh3mqlua@2tcbsd4f3dtv>
References: <20250507193538.2140862-1-vladimir.zapolskiy@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507193538.2140862-1-vladimir.zapolskiy@linaro.org>
X-Authority-Analysis: v=2.4 cv=L9cdQ/T8 c=1 sm=1 tr=0 ts=681bcf9d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=-t1pgZ-jyF7rHdee9YQA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: IqfpnHW1avppej2JFD31avvJYOY7PHF5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA3MDE5NyBTYWx0ZWRfX1LrBBbj/GrkV
 DkRWH08fokGbuOYHvQ9/yQX4+9OJWoBeSstygROchcNetnnEX0oBOzFgWxsYoCgu1+//b2/0Vk9
 twh3D9E7Ri5u5gVImw0bGK4h9XbI/pO50FOYnFB6nQSf+ssROcxkc4qOUMd2oJkLAVLZMdtxCBF
 vOY9kK1wJzY9AcFU8pInhXHO2VjAAPQiXOWn7QWO2fQd9/HbNH4ofNswnTsyQwZBrIcUZTm5Uts
 4fReCq1fbYS0dIQ86MuOYB9kD1+E9KSMFxjr/xRznVkFVL1CoOdnKFBjs2mXbJoQ+OtW5mUYoDQ
 DSck0UNLl/QatXZ5RvPZ0tihLpwoZmJqy5zVpRBQRyChYUyuHLn8zErxK7PAMuIvVLvYVFmGI7r
 vql4g5JiVEfhunLVfiGV8ooFf7HN3+6kE0EQakiIofkUo3p594M21DCqSgfj+Y47xyjDj/ck
X-Proofpoint-ORIG-GUID: IqfpnHW1avppej2JFD31avvJYOY7PHF5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-07_07,2025-05-07_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=999 spamscore=0 suspectscore=0 impostorscore=0
 mlxscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505070197
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

On Wed, May 07, 2025 at 10:35:38PM +0300, Vladimir Zapolskiy wrote:
> Trivial change, there is a managed device resource version of
> of_platform_populate(), and its usage simplifies the code a bit.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>  drivers/gpu/drm/msm/msm_mdss.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> index dcb49fd30402..116e8f93f8c8 100644
> --- a/drivers/gpu/drm/msm/msm_mdss.c
> +++ b/drivers/gpu/drm/msm/msm_mdss.c
> @@ -550,7 +550,7 @@ static int mdss_probe(struct platform_device *pdev)
>  	 * Populate the children devices, find the MDP5/DPU node, and then add
>  	 * the interfaces to our components list.
>  	 */
> -	ret = of_platform_populate(dev->of_node, NULL, NULL, dev);
> +	ret = devm_of_platform_populate(dev);
>  	if (ret) {
>  		DRM_DEV_ERROR(dev, "failed to populate children devices\n");
>  		msm_mdss_destroy(mdss);
> @@ -564,8 +564,6 @@ static void mdss_remove(struct platform_device *pdev)
>  {
>  	struct msm_mdss *mdss = platform_get_drvdata(pdev);
>  
> -	of_platform_depopulate(&pdev->dev);
> -
>  	msm_mdss_destroy(mdss);

Unfortunately this means that the child devices will still exist after
destroying the MDSS (IRQ domain, etc). So, it seems it can not land as
is.

>  }
>  
> -- 
> 2.45.2
> 

-- 
With best wishes
Dmitry
