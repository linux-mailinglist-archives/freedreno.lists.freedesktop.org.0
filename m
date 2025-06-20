Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD9EAE21D5
	for <lists+freedreno@lfdr.de>; Fri, 20 Jun 2025 20:14:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A6EF10E0BF;
	Fri, 20 Jun 2025 18:14:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="UkdN/irB";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CA5610E0BF
 for <freedreno@lists.freedesktop.org>; Fri, 20 Jun 2025 18:14:01 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55KFRVjC024309
 for <freedreno@lists.freedesktop.org>; Fri, 20 Jun 2025 18:14:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 jG+tT6iYc7a6QUyEAhUjHjnsvAkz1ye2EdBIx/ExqFk=; b=UkdN/irB8eMnJ2NO
 0jKqzAQYkjVmkjPwzGLnd2yjmhC6ai+LAD0gYtUrCOK8BEwRvqqoZR/ugLxYiVuX
 9k9jLWr44aC3OHxETeTlhAm5+i8CiiOz8ZilzWSUj7Q4JnCemiVtWuStq45Huipk
 A2+GSGi0whhqnkJ4UEP5TzN7Q/5w/1yuxrrFt/OdGIICQ5+CmHrvfC6J0/KF+aSS
 0YloyFiwf30ppri10MrRtHrzhqKNyO8yu9zt9UQBThQGIkh4AnV5NWIsl3e7YfQ9
 MsdHh5fl5Yox+G5VF2uNNL4og0XshRfyaWglpdIwx/PjnaavMahQY9VnybmUaRgI
 ERE2Ng==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47daa4ren4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 20 Jun 2025 18:14:00 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7caee990721so466569685a.1
 for <freedreno@lists.freedesktop.org>; Fri, 20 Jun 2025 11:14:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750443240; x=1751048040;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jG+tT6iYc7a6QUyEAhUjHjnsvAkz1ye2EdBIx/ExqFk=;
 b=rC6uyISkH+Kj2B31lEFjXs6WfRUboC9V6P77Vegkk5V6cr3z+ICub90zDRRcnuSBRI
 9Tb6iGKNXi5/3DED+qWfKuuM0VWHV+PoDrpnxtQ2w8pcGTDchu16MS7TU9R5BBSP4Hhb
 s8GUSNXoGqGbjwoytcdQLPBEYLykbdVZrqPoQr48AnfMZX10rWuF9Uc2f+Rx5h/3mGYJ
 oyTBlauBvDPIKs0OT4g1u/nK/6lAgDanAoqg16OtemudTQYAD4xl99XwSk1K0azgtpFh
 9h4aETQDnpDIrxuCEa7iCOhUEOgqMr+JY9c3tLmPL8nuwqhhSwdlBC3dRTbaTOmj5aE6
 25Rg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVibWcRIu2Qe4DeLqb9l+uqyH+RrvLV4s18756J50RIU39McboIm4G9ZRJzkxGRDAnHX5vdB91zSsk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxfr65Ql6BDF7IqkLjJMG/w/2P1SLN+wrlVoMY40dzyEBYFcig1
 b/IE5etsfBWQMmVRTo6MVwfMbl/k/Hm1kJY4+9ktulglsPHSnXLfDkEdxZxA8y8g+9g4PLcmmSY
 dOZRkAO8A+VaGjD85UojYJeEiWGlm9xWZWAOtngvQXOtTm/8Tk0hXxCZkOMdRSdwmLVMhMWg=
X-Gm-Gg: ASbGncvpQqPH/Tzr1QeqzlexyNlBsrQAbyXwmXtf8tHu8tGVOLMI2lGRssr66E3c4Rr
 YeCE5F6HUgo4LiQnWqliS8mBiibmLyx+QZrsabuzEHiLMa9GDeCqek3o66M0gW7vgF2c3d03xUz
 uJqE3tckKG4jED7UG4t5JtakH9j6GjNAUMnetm1J2xLC6KMBi7HrdIreBhq0z39vx9Si+t9Bu58
 dEhS7170XNQGHuxd82e8SNfL/wN+zi0qvi8lyFmPX+0Zxk111lUAkiydeXh5VHVYWAh71SO1kQJ
 PqURrmGNr8tuspC5lCSXg5P2lFbi0/1h923k3oqu0DBvaf9Ibd/6HhHj0X0eYuU8KchQ6o9agsr
 tuWCOgQWPyHqLhJc4tv5w255XSEvm/x1VfE4=
X-Received: by 2002:a05:620a:f12:b0:7d0:a25b:d04c with SMTP id
 af79cd13be357-7d3f98c5721mr607832985a.9.1750443239579; 
 Fri, 20 Jun 2025 11:13:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGrRvs8vYgSxtHBNL8Gik6EafDnQeb6cUhaJFFn4yZST6SpGSMyqxM73JI0IZzDqbtPeAIlXg==
X-Received: by 2002:a05:620a:f12:b0:7d0:a25b:d04c with SMTP id
 af79cd13be357-7d3f98c5721mr607826485a.9.1750443238988; 
 Fri, 20 Jun 2025 11:13:58 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-553e4144306sm363384e87.18.2025.06.20.11.13.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jun 2025 11:13:56 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v5 00/30] drm/msm/dpu: rework HW block feature handling
Date: Fri, 20 Jun 2025 21:13:51 +0300
Message-Id: <175044313810.2014621.9717827153141285782.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250522-dpu-drop-features-v5-0-3b2085a07884@oss.qualcomm.com>
References: <20250522-dpu-drop-features-v5-0-3b2085a07884@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: uGRx9OXrzeMIiszBfw4veWg2Aqu96PBq
X-Proofpoint-ORIG-GUID: uGRx9OXrzeMIiszBfw4veWg2Aqu96PBq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDEyNyBTYWx0ZWRfX0q4VeXhW/vTc
 LFGQZNJphrXX9t4ZnEiSD5N9rh3AtIPz6ciS+pNSCr8haLbCCGCX/c4zTR0ToUWW3sNOa6saRGD
 Z90iKsx4HORO0oxOCjIksNaNasyvQtpnDfJPvu6YPm2pie0tAO2qkZAf2o7Za3rIAqf8nLhQL1C
 MPVslNuq862KMT1yZXmvClKRYqD/DpXD8lOV0Nd7K6V4w/TH70vzp+ukqBzvh+mpED8ca1Nz7zo
 n3VRcWWYbE8zSItpFZvOA8cSgycpSeuWGQBG2MlicRdwvf4vT3L7zUpmFKZ1Oc+OJBx3ktAGqFT
 ccCvyI7gLQ+n85TrLN9FrtbbPCjb++2ex1oPACQ9AxeDCqZpxSUjHsaP0ZzxVH1fMQYsMJo3CTA
 GLJbPR289Rbwgv25Q7Ep5rT/6wHRuz9VYZx/7m5j1jMyUkRX+f7wmaIpPzvD3EmUT6FNpFMT
X-Authority-Analysis: v=2.4 cv=KphN2XWN c=1 sm=1 tr=0 ts=6855a4e8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=e5mUnYsNAAAA:8 a=KLh1uqfzAhr9BImysYoA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_07,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 mlxlogscore=842 mlxscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506200127
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


On Thu, 22 May 2025 22:03:19 +0300, Dmitry Baryshkov wrote:
> Some time ago we started the process of converting HW blocks to use
> revision-based checks instead of having feature bits (which are easy to
> miss or to set incorrectly). Then the process of such a conversion was
> postponed. (Mostly) finish the conversion. The only blocks which still
> have feature bits are SSPP, WB and VBIF. In the rare cases where
> behaviour actually differs from platform to platform (or from block to
> block) use unsigned long bitfields, they have simpler syntax to be
> checked and don't involve test_bit() invocation.
> 
> [...]

Applied, thanks!

[01/30] drm/msm/dpu: stop passing mdss_ver to setup_timing_gen()
        https://gitlab.freedesktop.org/lumag/msm/-/commit/5d25efaaa327
[02/30] drm/msm/dpu: drop INTF_SC7280_MASK
        https://gitlab.freedesktop.org/lumag/msm/-/commit/768d87108f24
[03/30] drm/msm/dpu: inline _setup_ctl_ops()
        https://gitlab.freedesktop.org/lumag/msm/-/commit/cc34e7f8d8a3
[04/30] drm/msm/dpu: inline _setup_dsc_ops()
        https://gitlab.freedesktop.org/lumag/msm/-/commit/155e4d05136b
[05/30] drm/msm/dpu: inline _setup_dspp_ops()
        https://gitlab.freedesktop.org/lumag/msm/-/commit/cfc1dbe27f63
[06/30] drm/msm/dpu: inline _setup_mixer_ops()
        https://gitlab.freedesktop.org/lumag/msm/-/commit/d01d027a6ae1
[07/30] drm/msm/dpu: remove DSPP_SC7180_MASK
        https://gitlab.freedesktop.org/lumag/msm/-/commit/64558d6ec1dc
[08/30] drm/msm/dpu: get rid of DPU_CTL_HAS_LAYER_EXT4
        https://gitlab.freedesktop.org/lumag/msm/-/commit/40b7aa8fb641
[09/30] drm/msm/dpu: get rid of DPU_CTL_ACTIVE_CFG
        https://gitlab.freedesktop.org/lumag/msm/-/commit/a1c5eafeab9b
[10/30] drm/msm/dpu: get rid of DPU_CTL_FETCH_ACTIVE
        https://gitlab.freedesktop.org/lumag/msm/-/commit/a22c33cb4ccc
[11/30] drm/msm/dpu: get rid of DPU_CTL_DSPP_SUB_BLOCK_FLUSH
        https://gitlab.freedesktop.org/lumag/msm/-/commit/91003d9f8fb6
[12/30] drm/msm/dpu: get rid of DPU_CTL_VM_CFG
        https://gitlab.freedesktop.org/lumag/msm/-/commit/e479fb02dc72
[13/30] drm/msm/dpu: get rid of DPU_DATA_HCTL_EN
        https://gitlab.freedesktop.org/lumag/msm/-/commit/39890da06970
[14/30] drm/msm/dpu: get rid of DPU_INTF_STATUS_SUPPORTED
        https://gitlab.freedesktop.org/lumag/msm/-/commit/e7da245a3402
[15/30] drm/msm/dpu: get rid of DPU_INTF_INPUT_CTRL
        https://gitlab.freedesktop.org/lumag/msm/-/commit/9db68425f24c
[16/30] drm/msm/dpu: get rid of DPU_PINGPONG_DSC
        https://gitlab.freedesktop.org/lumag/msm/-/commit/d521c4200c94
[17/30] drm/msm/dpu: get rid of DPU_PINGPONG_DITHER
        https://gitlab.freedesktop.org/lumag/msm/-/commit/bbd131f1e095
[18/30] drm/msm/dpu: get rid of DPU_MDP_VSYNC_SEL
        https://gitlab.freedesktop.org/lumag/msm/-/commit/5094aa5474a2
[19/30] drm/msm/dpu: get rid of DPU_MDP_PERIPH_0_REMOVED
        https://gitlab.freedesktop.org/lumag/msm/-/commit/820405f6e2e6
[20/30] drm/msm/dpu: get rid of DPU_MDP_AUDIO_SELECT
        https://gitlab.freedesktop.org/lumag/msm/-/commit/b14f7c55b079
[21/30] drm/msm/dpu: get rid of DPU_MIXER_COMBINED_ALPHA
        https://gitlab.freedesktop.org/lumag/msm/-/commit/5b14c003781b
[22/30] drm/msm/dpu: get rid of DPU_DIM_LAYER
        https://gitlab.freedesktop.org/lumag/msm/-/commit/36beee41c4c3
[23/30] drm/msm/dpu: get rid of DPU_DSC_HW_REV_1_2
        https://gitlab.freedesktop.org/lumag/msm/-/commit/27b1a01fcdb8
[24/30] drm/msm/dpu: get rid of DPU_DSC_OUTPUT_CTRL
        https://gitlab.freedesktop.org/lumag/msm/-/commit/a88c80ecb442
[25/30] drm/msm/dpu: get rid of DPU_WB_INPUT_CTRL
        https://gitlab.freedesktop.org/lumag/msm/-/commit/fa811f768713
[26/30] drm/msm/dpu: get rid of DPU_SSPP_QOS_8LVL
        https://gitlab.freedesktop.org/lumag/msm/-/commit/0709ec21abcf
[27/30] drm/msm/dpu: drop unused MDP TOP features
        https://gitlab.freedesktop.org/lumag/msm/-/commit/0ea9f990c352
[28/30] drm/msm/dpu: drop ununused PINGPONG features
        https://gitlab.freedesktop.org/lumag/msm/-/commit/a1e42a921dee
[29/30] drm/msm/dpu: drop ununused MIXER features
        https://gitlab.freedesktop.org/lumag/msm/-/commit/1f783bf4f8f9
[30/30] drm/msm/dpu: move features out of the DPU_HW_BLK_INFO
        https://gitlab.freedesktop.org/lumag/msm/-/commit/c70c860fb00c

Best regards,
-- 
With best wishes
Dmitry

