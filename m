Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14288C014BB
	for <lists+freedreno@lfdr.de>; Thu, 23 Oct 2025 15:16:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E69410E8FE;
	Thu, 23 Oct 2025 13:16:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="P6J0NOkt";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3E6810E02F
 for <freedreno@lists.freedesktop.org>; Thu, 23 Oct 2025 09:02:50 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N6m4M8029729
 for <freedreno@lists.freedesktop.org>; Thu, 23 Oct 2025 09:02:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=MalpcSnxYq9dA6R/9QMOFRvU
 abPhDrPSEV9lSVwC0ds=; b=P6J0NOkt6oOMbuj3eWr+66ziwPdaAZFJTRqHlbcb
 A2HmFa6tftnFXZg8ExvCzOspfY2NMEQpXW+q6Jm7f20z8smaax/oPCxFb5N54I/G
 rDKco55nNrd3COa6DqyEOw0ucsQIlbDQ2YFkzs6cK0TlMCdbw4AkEYepsC/Z202z
 ym7QPUej18Cc39bfsXFOz6g7oQuQjHvbXSNy7enzO4+K4pAOAs/ZmisG/elhYwyo
 hF5OECymbrXEC0APwLfiPwbT5p3/wmybp/SOsIOP9BMeaHvIcO0EngoC4UjsUNUV
 5vYvgB0B7OQ8EHTAuDAZKBLR4t+SjaOPYeIMXWekBXB0VQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v2ge7qcp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 23 Oct 2025 09:02:49 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-b5535902495so398918a12.0
 for <freedreno@lists.freedesktop.org>; Thu, 23 Oct 2025 02:02:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761210168; x=1761814968;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MalpcSnxYq9dA6R/9QMOFRvUabPhDrPSEV9lSVwC0ds=;
 b=fRiuZYjX2Na5x0wo+LJStKJ6TC5QLvicsjEoHM9IeG3fk+uAyW6B09PWJtBK8IDXfC
 5oSYa5SPYoRhOPMAInwN/CviIK6R5E2p2CDxarAdgiZNZjihVjT1Qz0A8wJIlFzvcyBN
 EovkessoUcpaSVgoy9eZSCLakBDvG8YqZBRvvSTVZdg6WhaLav2o1Ff2SzV8J8JLcI9N
 mE6gwZ0W27vyDzlZHeLpLUU+y66gQLnmYIgpJ+2qtEeTs7Xtwsihd+JKvhKELrPZWKoo
 vVAEgXPzTKdhy8O0Mi/QmaAlH23qOzptbswYWi5xMLcLVVvEk34s+JwRfB2HJMTVWLoG
 o/gg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0s55W7GR/PGg8jDvN1C6lkcT9H5/cPyQRl3Y8Pa27xo/Jx4p4XhUEhIBgfEbitqiZweCUnOyH2r4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy+EHHHSMm1x/ioAl/KEMLbhkpUQmJq1LOiYrscjzxYOLZtwqeF
 wbKieYc1URrmYn/9WuG4+REKgn4oLWfkKc3q2Qdi5ws3M3Z9DgiYFyys4EmSDjZh68fJoFdnYrg
 JuFqEDIbH/Qyjkd9NoIVTQz7WZPL0kQqwDCVL+KfE0y0+mxeBeAK6wT6h9ipuz84FFbkwsyw=
X-Gm-Gg: ASbGncsspweXppBitiqQq/4KMPN9punoOfnQtaDdJvsQ0R8+90WydJlhkc1yy54ZGbt
 MF1K5dB4sjG11NNCLe/8lkZz8TkiOaELjYiowMawA2cmECx4ahBhTreSQLwE89zk3Kh3vnz/4qI
 RJW0hYJpWRYo7HT5dF0elJKL3f4L2QOQXSlwiEKAiXp4CbARFz0K2+idh8gL14YaiGKXtxBHwtr
 we0cLQKy+qw5Gl+vjayEeBp+ErV8RCXHKKkg/J8zcPOhhyhcCKIoooqvYpOmA2Pm2ky/Wio1Kj1
 iM/eB3HdJAoW8SohVZNF/T+5ybSfhUgnmhT5s7TfUQoWTfFsGivF8+5+N6CsQzCmz7H7n44T25z
 mRo2YGTaMYWw1ivV+shbqeHAfqXTLpwePQ2L7yWnaEwS3p9bBfMG6Ug==
X-Received: by 2002:a05:6a20:6a0e:b0:251:43f5:cad4 with SMTP id
 adf61e73a8af0-334a8523f0fmr34082086637.10.1761210168345; 
 Thu, 23 Oct 2025 02:02:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGDRzsK8hhHTbHS88g7R6gWrzYmoBOYsl4eyr6xderBPGGwFWTjTdHzLDoKqJbYcV5t7wEgyw==
X-Received: by 2002:a05:6a20:6a0e:b0:251:43f5:cad4 with SMTP id
 adf61e73a8af0-334a8523f0fmr34082037637.10.1761210167794; 
 Thu, 23 Oct 2025 02:02:47 -0700 (PDT)
Received: from yuanjiey.ap.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-33fb0196831sm1722206a91.20.2025.10.23.02.02.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Oct 2025 02:02:47 -0700 (PDT)
Date: Thu, 23 Oct 2025 17:02:35 +0800
From: yuanjiey <yuanjie.yang@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
 quic_khsieh@quicinc.com, neil.armstrong@linaro.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH 08/12] arm64: defconfig: Enable NT37801 DSI panel driver
Message-ID: <aPnvKxiv2I/XeI4K@yuanjiey.ap.qualcomm.com>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-3-yuanjie.yang@oss.qualcomm.com>
 <207f25e9-3685-4838-a384-e6bfe6f8c244@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <207f25e9-3685-4838-a384-e6bfe6f8c244@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMCBTYWx0ZWRfX8IcCpBWdb940
 9iTFAZI+mem8TrSC+mUZSX83rm1xvQFCHGgvW/xxxTkNCSh0ArwB1n8NbCNQrjAgF5DxavZWjIo
 p0QQGG+4j+/aPAITELSnpY1cF3gqcpjbL8LSEwxowXvRNvCQjtHJZdQcZUxmoTZRr31Y1VeZ/+v
 1O6537AK9ueDPTIByvBNTAn64fK02qLO/3ej0QSiMx+YRcD71d43JEizqjM5zOGwipouYdh9XBG
 uPXkbyrDlf1oR0LPkQkh/ZBRRd5B02Zcd/RJlJiXdvVZ5AYXnsAkpSd+ETWJ1t5C0sxh5FwYzlq
 8877F0w+khWICjvNAe6ypr9vywL02PXuO8L+Dzz0nju9gRI5mg97iKkOrOergQWUAo3SCymqsuK
 lhPzQNoWQzCVDhVRhRgsFA1AYn/aAA==
X-Authority-Analysis: v=2.4 cv=KqFAGGWN c=1 sm=1 tr=0 ts=68f9ef39 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=-XBAuW2u0JZaUNqFeVsA:9 a=CjuIK1q_8ugA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: a1iNYymcImqUqy74zqhnKG88sB5TIYg_
X-Proofpoint-ORIG-GUID: a1iNYymcImqUqy74zqhnKG88sB5TIYg_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180020
X-Mailman-Approved-At: Thu, 23 Oct 2025 13:16:01 +0000
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

On Thu, Oct 23, 2025 at 10:22:36AM +0200, Konrad Dybcio wrote:
> On 10/23/25 10:06 AM, yuanjie yang wrote:
> > From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > 
> > Build the NT37801 DSI panel driver as module.
> 
> Yes, we can see that's what happens in the diff below.
> 
> You failed to state the "why"

 Novatek NT37801 panel is used on Qualcomm Kaanapali-mtp and SM8750-mtp board.
  
 I will give this reason in split panel patch.

Thanks,
Yuanjie



> Konrad
> 
> > 
> > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > ---
> >  arch/arm64/configs/defconfig | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> > index 8cfb5000fa8e..537a065db11c 100644
> > --- a/arch/arm64/configs/defconfig
> > +++ b/arch/arm64/configs/defconfig
> > @@ -945,6 +945,7 @@ CONFIG_DRM_PANEL_SITRONIX_ST7703=m
> >  CONFIG_DRM_PANEL_STARTEK_KD070FHFID015=m
> >  CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA=m
> >  CONFIG_DRM_PANEL_VISIONOX_VTDR6130=m
> > +CONFIG_DRM_PANEL_NOVATEK_NT37801=m
> >  CONFIG_DRM_DISPLAY_CONNECTOR=m
> >  CONFIG_DRM_FSL_LDB=m
> >  CONFIG_DRM_ITE_IT6263=m
