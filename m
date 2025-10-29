Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3C7C18116
	for <lists+freedreno@lfdr.de>; Wed, 29 Oct 2025 03:37:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB04210E0C3;
	Wed, 29 Oct 2025 02:37:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="XXWZjrTk";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J+Oj4ltR";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49C0710E0C5
 for <freedreno@lists.freedesktop.org>; Wed, 29 Oct 2025 02:37:51 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59SJli462525638
 for <freedreno@lists.freedesktop.org>; Wed, 29 Oct 2025 02:37:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=0MU0AfPnpKaX0wUSQTeDsGNj
 N1sxzIkts1un5DkBdeY=; b=XXWZjrTkn25TznXvh15LPt4hslGwgyTqqhgaIoo9
 g1g5zRJeHdSi0QFaO/L3QjbmehOOUxk8KtC2znoLu2m8ELsz0ZoJ+ZRJar39N853
 /l5eir0IJEUeBPSSfgp3hcyaj9CFyhRnZiTfk8T4g3fHU4IhX/IYMPOJ/uLDjc/m
 HaEt0hmAG82xW6Es1oQBJE6Z3I6j7je4GMEMCddzMq5kPx2vavfhpitjkcZrETfu
 hDMWFsX5wWyGjwaLbaa6zdCf3luotzUpnkzC+aZ65Q2TUEbWeR2zDBOEgujahb8X
 NcYh7tKE3FQdNis2yudm7dE5acfM05Tu6pxvdIkT24F6Tg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a3rwh2-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 29 Oct 2025 02:37:50 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8a27ed89773so957302285a.2
 for <freedreno@lists.freedesktop.org>; Tue, 28 Oct 2025 19:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1761705470; x=1762310270;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=0MU0AfPnpKaX0wUSQTeDsGNjN1sxzIkts1un5DkBdeY=;
 b=J+Oj4ltR6K95ddNSj/PlVjY3bF1HrVfv3ulBzF/aZuyClUEKJX1inA3tf/PTpIvlOn
 Ftw00M3G5ge0x1vkbZS6DdaTKVIeIPQib4fPV6zJ2hH2mSAUvCDyHEd2/cVrdO31XyeA
 GSssxpNcTajaOG6yhSZFTbbDr5WKdKpd18ojEPlUxP+7PCgqXYhbVj2jFcQzBaExdPTp
 +jLkERFR8LedEo16BbrHWkN837zAIlUoQ+Elcpu1J60PM+nLffq5PPe6RYK5H5VNG/Vn
 53gBXdmC1l6PdxAtW864ZAFS42b8E8fiEEeL3gOtQhj/PUL4IWsuWJKLOM4DCGpZ3xHX
 qF3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761705470; x=1762310270;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0MU0AfPnpKaX0wUSQTeDsGNjN1sxzIkts1un5DkBdeY=;
 b=I7Sr+XSsXFWzSi1DG+eoSHuA9czEXnNw0ln6DkjRj+5cGnJTwxc+WLls8/In9fiLgJ
 Yh9u/rT6NyUPgxCkXHwSgYZ0D9DX95Pio17p+2kiRX3cZFNdzq42ffZnzVA18mmhYD3p
 YBimmNKnidi5hsmtu+Pu1Eu7Uw8yigVzey0GwUYWX+R6LlbT/cCt/ucRP7HA3e8iTP5y
 vdzqarGnoQQYPOKptJn8k9gAMx4xmUMHoqAP7FhQU5rvWhlxu1j5GpMg+Tjn8ZFHdstN
 FYRKdEp4o6deVEHIlbEapvcABZfTDXktHrv79rWL1DPzNo6xcGNX9Ti7q3/0T2W0t5Vv
 bZbA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWebzqnOVyAbxWF9TJl9ukIFET+ED17y9b33M7TfIYRdbfHPg1gJxCb9jV6+p515yuGtsWpNAdtkCE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzcG5M880lTHcbVB3n6gP1bWVZ8I/VC7BomfLXkyqlYxlUfgpUj
 YIQMgR5uPFxnUjRtysnI7tU0Ia/vLnME+xX6cZMdHUtcRozCa41pXEktBszIHm3WK6Lw5sZCWGX
 CTz2f0NEkvobmN8hfZSFvtbUQGMkAsX3einh/dpxWWTDIqtitIsnMaiRNBCLZFnrFRkZm10Q=
X-Gm-Gg: ASbGnctaCfChiYqZzyrZmUAMy/wXasPnxCjSEBbD6Nm+0HWwY9hKL9hIj8gJCX0V+O8
 JbwOOeJ2yUNRKNpk2naT8VeKVu8rzRTyLast9vF6/Ko7v42+z4p2NthB4Ts44a5SyaahJqt4cx6
 p+tf/VgnEPEVV7n8fCqyu4gsA3+ingEsYBkJnsqjzWp7fbOS9cpWL5XfkDb+YnhraCLaYLLEf23
 Kf0sDZ4CTQwIK6SoOrf3wkyd6JWt3PGiAhkdktmY3BaX6c+dtoAXjRqfCCwBXIRwmFqTSbLGaKk
 DvKFVSvEG3xbVxJ/fod/d68nX6fX6a2iDLdWgSdKlG9kgOJFNP0QNVGf+W4zkFrgHikITZHPyWX
 QyH7ww6IXPhLNBalvtZZdKwtiAA57ir6gZA899zroYUUTE3zl/u6ZToEUp3dQRrrr
X-Received: by 2002:a05:620a:4412:b0:862:3e8d:e4ec with SMTP id
 af79cd13be357-8a8e6954aebmr215711185a.60.1761705469465; 
 Tue, 28 Oct 2025 19:37:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFLoBX0vUikArQtQfx9YHtcyAX45KfBodi8D7Jo3dT7imVYdDfzHcZOA7AEQgVHqJh3CLxDUg==
X-Received: by 2002:a05:620a:4412:b0:862:3e8d:e4ec with SMTP id
 af79cd13be357-8a8e6954aebmr215707685a.60.1761705468912; 
 Tue, 28 Oct 2025 19:37:48 -0700 (PDT)
Received: from yuanjiey.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-89f24cd5617sm963961385a.19.2025.10.28.19.37.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Oct 2025 19:37:48 -0700 (PDT)
Date: Wed, 29 Oct 2025 10:37:37 +0800
From: yuanjiey <yuanjie.yang@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
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
Message-ID: <aQF98RvLuOlJZlFi@yuanjiey.ap.qualcomm.com>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-3-yuanjie.yang@oss.qualcomm.com>
 <wuh7agcgg6spghilnx4amqukaaydj25u7kbdiod7fl6pu2ulvm@pmosyuo43cyw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <wuh7agcgg6spghilnx4amqukaaydj25u7kbdiod7fl6pu2ulvm@pmosyuo43cyw>
X-Proofpoint-ORIG-GUID: mhya0ZJKShhMEKdEZMWlBdJCIW5Md5jv
X-Authority-Analysis: v=2.4 cv=HM3O14tv c=1 sm=1 tr=0 ts=69017dfe cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=yK9oDwkn9_E4VEaIOE4A:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDAxOSBTYWx0ZWRfX/DeUlgF384At
 myyL9a4xSvsZDv9fdC/2bAjSSUmfxp27ViPLNW/SGCPqKCW8I3ASS8qAOZhNALLoIQbAZD4KA2E
 meoifaMd6tg9f2zVBdzq8TLLWlOxIfaylu4WINiGxiKzOMR3/ck7okAj9i0ptT+5WAEQqkcGZn5
 xMPaZTiuwdJhM6a8sexwqJkkKZYuyvi64CF8BWfEs+apr9Kf2cZrGkY646mOBifG//cjI9SfnJP
 JPBeOMygYQ7Msa1SPcTQfadkzBICcWw5gd3sLi36X20F3okR2Eokj7krmvTk6nKV+dL35fdjZJ/
 kTpdRbJEvE3CTA0keaU5xxzQGXrIr9+nGi/Ny2KRXOCONFSVDPeAN/0i+I4JzLNVLisJOf+jvCm
 v/Wm20HIVkIzVtZbPjolEuJ+vCnmcg==
X-Proofpoint-GUID: mhya0ZJKShhMEKdEZMWlBdJCIW5Md5jv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-29_01,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290019
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

On Mon, Oct 27, 2025 at 10:51:23PM -0500, Bjorn Andersson wrote:
> On Thu, Oct 23, 2025 at 04:06:05PM +0800, yuanjie yang wrote:
> > From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > 
> > Build the NT37801 DSI panel driver as module.
> > 
> > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> 
> You (Yuanjie) authored the patch, but forgot to sign-off, then Yongxing
> provided certificate of origin, then you provide certificate of origin
> and send it to list?
> 
> Please correct.

All the display patches were jointly developed by Yongxing and me.
So every patch 
I do sign below:
 Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
 Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>


I am the author of these patches.
So author is me:
From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
 
Do I need to fix this sign below in next patch:

 Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
 Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
 Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>


> Also, all other patches in this series are merged by DRM maintainers,
> while I'm supposed to merge this one. Please send it separately, once
> it's ready to be merged.
 
Sure, I will split this patch to push.

Thanks,
Yuanjie

> Thanks,
> Bjorn
> 
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
> > -- 
> > 2.34.1
> > 
