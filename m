Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E3EAC13BD
	for <lists+freedreno@lfdr.de>; Thu, 22 May 2025 20:54:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30D6210E735;
	Thu, 22 May 2025 18:53:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="gDQoB3fz";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD36810E735
 for <freedreno@lists.freedesktop.org>; Thu, 22 May 2025 18:53:53 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MGFoux016529
 for <freedreno@lists.freedesktop.org>; Thu, 22 May 2025 18:53:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=38zWe9upC0kBIerry3BI5xcS
 uLu49jVZpKxNE+7H2Gc=; b=gDQoB3fzYeck8hySEXpuPXHZAMvgvA7riLL1hXWs
 /IPFZOsLRBkF9HGzDOnFOitNGNkq1yG2phnD4IqmUfQATu6X4zu8NmavV9rPSIND
 30B1r4eyrVmtOEDFZK51yrEpzYrov14I2MolkbbwnkgRr9Fvz8aPeWwpZi4+o8NP
 pPs/idv2pRqQU3XUEN9chari3H+/5RM1cHoObLaMM4WbDNYRluqVwJA+G9feSUcQ
 EaL4G32kOKFW+770fK3/M6P4etVho4n/yJCAmdM+YMKG8RmRMY3gBOcWNpUKPG8R
 JmXCzKWg9uNTVyDMBAhRUB70eUdLHd1AKBCJ1EeTTgidWQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf9yehk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 22 May 2025 18:53:52 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c5d608e6f5so1981288285a.0
 for <freedreno@lists.freedesktop.org>; Thu, 22 May 2025 11:53:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747940032; x=1748544832;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=38zWe9upC0kBIerry3BI5xcSuLu49jVZpKxNE+7H2Gc=;
 b=t9100qwzJk0BmalwB+AFpzmGBypxn7LuAB60QNGHIzbT9BWvvIhjLsU4G9uT/y+xdk
 8GnTYatqd0l03kFlM6+XNiDHkV0tk2eVae5yChpMWhflulX4PLkA3Reh8yrTTplWT46e
 QUwLmK06i+MIPon2EbokVWiYOvRw3lsT5yGjvcd1ikKKtnrefO/8hZ8LTqn8Apa01k8D
 Xdg/NhWKFuFASKYJrdh7uP5sODyH1b6SS5kUsv+zBt+xb8q5TldEmycPEHb8Om3tWUgO
 sFnNNf5ufWrxjUygqXNHdS514WE+KYAjYnbYPxLLogJ4a9YyzkdaD3FX8Vmx1T+4unJl
 rOyg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUziQB2xjXoUan1LSDaReB0mk08WrfmYo7MnHDPScT14yOMX3+5i/zwokt8lMDTmnw99wP5XzZFsv4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzD5o1lRni7Kj+QUBpSwV2QbuS9W64kMK1tFV9rayUQgEh5Qq/O
 y3E1MtCU62TdS+I13lOC5g07VWvbKrjp8Lw2eDldqFD75gzmBQhmnrOAnHA+VY/V2qULBrafMtX
 GNyBzL8pLRotSBSqF6aH820ZyaF3K304OB/gSJW/DWYemNQ6LV7h4+AgyqdjkEFlmwAMSQb4=
X-Gm-Gg: ASbGncve34a3kRHRebtDDpCIAp77t5A6LBo2knyuTsihlP16PCzzg999tkUYO4DjYh9
 sdCkt/afKlaZ2YjJaN5Igg1nJLYkekxVUNO6RCqR2kwSnieWawPZXNnofmGIlEKZpYWIcl2JH/a
 WL8+mFFR/mgAJ2vwTNJEiX0sHInX5viP6McdfgSgjMzYCp2tT6Wu4/hYNik6qaoKXdiGcU5+doL
 u0s51Me+b2z7dglO8JuEqH7QUluCDNh5iNO1kgxhpBJ0bWWM3+RbIYbE94W/2VyA9IXGAIxcB2O
 7xkiesqH2xFBX4KRcCIuMRGJJNfex9xggvNGOfGOpKcgrV3rylcgX5G+VhojB6hj5uTJuN/hOEw
 =
X-Received: by 2002:a05:620a:25d4:b0:7c5:562d:ccfa with SMTP id
 af79cd13be357-7cd47facb7dmr4080953385a.36.1747940032030; 
 Thu, 22 May 2025 11:53:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG2WfwBOxC54aOuWPMmC2+V1YOrtw5z5DzwfXMuy+nfcNwlEf/jKVEhD0ub9XPNyNJJ11nUSQ==
X-Received: by 2002:a05:620a:25d4:b0:7c5:562d:ccfa with SMTP id
 af79cd13be357-7cd47facb7dmr4080949185a.36.1747940031641; 
 Thu, 22 May 2025 11:53:51 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e6f351a6sm3508823e87.88.2025.05.22.11.53.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 May 2025 11:53:50 -0700 (PDT)
Date: Thu, 22 May 2025 21:53:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 09/30] drm/msm/dpu: get rid of DPU_CTL_ACTIVE_CFG
Message-ID: <uetcrmujwpv5jzaov667z7u267oyn7wqpz2i5etxjk672c47nq@wtddlcqubysi>
References: <20250519-dpu-drop-features-v4-0-6c5e88e31383@oss.qualcomm.com>
 <20250519-dpu-drop-features-v4-9-6c5e88e31383@oss.qualcomm.com>
 <f6a10e14-de53-43e1-a887-4a4ba4aa0d63@linaro.org>
 <w3i22a7magzaseje3j7o4qjvkxeslj7wm2uhdcn3o3nrotsrzs@gzdgfrl55qsz>
 <e2173a8f-db10-4fd3-8bdb-ea5e6664237e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e2173a8f-db10-4fd3-8bdb-ea5e6664237e@linaro.org>
X-Authority-Analysis: v=2.4 cv=V9990fni c=1 sm=1 tr=0 ts=682f72c0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=Aotn53-9w846ZEucy3YA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Zl0PmtVf12Ch4cijaGjmlPotoemnE3KJ
X-Proofpoint-GUID: Zl0PmtVf12Ch4cijaGjmlPotoemnE3KJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE5MSBTYWx0ZWRfX4Eqg94TAnXe+
 B3RafYxCVC9e5bMmspucSx5JtRiImowAL3LTt8MigAQnZf5v42+KVhoi8ZR5AdXA68uiRDyZ98W
 ycVjOBjKFr01IBchVWiYlLnLcaLIgbyXdtH9YyuqWoGhNWNqppEe3x3VeS1Y5IeG91F9TIGprlL
 7h3NuJ0zpfjP5HPLe+i4Nj1nS/2CVuFAdWwDAFNHasL/2dykhNkR8+o7ZglsoB3hX4G03m/ojYY
 WxRokYEZqPLdqbQUdCDuLfhQ1Q2L1lvHIcyjT0MvJjIs3G4YrjONIBWpY2SHQW42jFk1eJxV8DG
 QKiSEphnPGHHjcU1AyGoj1ebYgXPgvS7y6YDwfUQSAWuw1uPsgp8rAri+poHiJozQLW8cCtf1Et
 28EH6i4hLWygHMCtWSy+Xgja/NDNYwfq8AxrC6t8ZqZR9QTPh2UNtfkX1qWcL/hJCrj8d+WA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_09,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 spamscore=0 phishscore=0 suspectscore=0
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505220191
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

On Wed, May 21, 2025 at 02:51:22PM +0200, Neil Armstrong wrote:
> On 20/05/2025 23:29, Dmitry Baryshkov wrote:
> > On Tue, May 20, 2025 at 09:57:38AM +0200, neil.armstrong@linaro.org wrote:
> > > On 19/05/2025 18:04, Dmitry Baryshkov wrote:
> > > > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > 
> > > > Continue migration to the MDSS-revision based checks and replace
> > > > DPU_CTL_ACTIVE_CFG feature bit with the core_major_ver >= 5 check.
> > > > 
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > > ---
> > > >    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h  | 6 ------
> > > >    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h | 6 ------
> > > >    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h  | 6 ------
> > > >    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h  | 6 ------
> > > >    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h  | 6 ------
> > > >    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h  | 6 ------
> > > >    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h  | 3 ---
> > > >    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h  | 1 -
> > > >    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h  | 4 ----
> > > >    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h | 1 -
> > > >    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h  | 1 -
> > > >    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c    | 2 +-
> > > >    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c    | 2 +-
> > > >    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c     | 7 ++-----
> > > >    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c          | 3 +--
> > > >    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h          | 1 -
> > > >    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c              | 2 +-
> > > >    17 files changed, 6 insertions(+), 57 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> > > > index a0ba55ab3c894c200225fe48ec6214ae4135d059..25ba5d9bfff2b3f7a5054ae26511d05917f72d8b 100644
> > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> > > > @@ -69,7 +69,7 @@ static void _dpu_encoder_phys_cmd_update_intf_cfg(
> > > >    	ctl->ops.setup_intf_cfg(ctl, &intf_cfg);
> > > >    	/* setup which pp blk will connect to this intf */
> > > > -	if (test_bit(DPU_CTL_ACTIVE_CFG, &ctl->caps->features) && phys_enc->hw_intf->ops.bind_pingpong_blk)
> > > > +	if (phys_enc->hw_intf->ops.bind_pingpong_blk)
> > > 
> > > Why did you drop the version test here ?
> > 
> > bind_pingpong_blk is only available since DPU 5.x, the same set of
> > hardware as the DPU having DPU_CTL_ACTIVE_CFG.
> > 
> 
> I think it deserves a comment in the code or the commit msg.

Ack

-- 
With best wishes
Dmitry
