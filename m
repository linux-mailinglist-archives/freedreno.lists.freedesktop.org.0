Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A39F3D03218
	for <lists+freedreno@lfdr.de>; Thu, 08 Jan 2026 14:46:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BDFB10E730;
	Thu,  8 Jan 2026 13:46:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VkPQZ39X";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wjj5XAjq";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0A9710E730
 for <freedreno@lists.freedesktop.org>; Thu,  8 Jan 2026 13:46:26 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 608CoDHl3890457
 for <freedreno@lists.freedesktop.org>; Thu, 8 Jan 2026 13:46:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=kZU9D7A0bMPBh/K2lCh2in/v
 SVoKAdenRjv1onBswg4=; b=VkPQZ39X206YaoJUEQzEX9iks5qHQMjDYPeapjrM
 OStvzEUW2ATCKSiPOEqwoqHSvXSQpMWP+l8BvwTNnfMNQ1qbi0g4bp796CFjQDlf
 dHKk4zJVFlMsYDU3DhkaMI/00BfEUFZcpIxqbrAVi5qrD/veY1aHm1KEZeiHPSDE
 SjyH52T4xYtHsADH30HEvv7dCso9HgDFhwTFvfmuuXo9laikZy7csdYuGQs6d1nj
 vtyqbqWXH2TXkEYqrKU2xtWQwylAp4YEMzjPYhPLDNGO2gfvpg1C7wA5ADva/QFO
 F2txubh1LumCEF3GPfdyWLaGk8hPzTGvGEEQce8HvAdbaA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhuy739e5-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 08 Jan 2026 13:46:25 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8bc4493d315so775483385a.1
 for <freedreno@lists.freedesktop.org>; Thu, 08 Jan 2026 05:46:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767879985; x=1768484785;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=kZU9D7A0bMPBh/K2lCh2in/vSVoKAdenRjv1onBswg4=;
 b=Wjj5XAjqwzIKQJjlvhuS11IGnfyYuGC7V8d3hvzStBjZ87z8CyM8BjmFuNyL3gHrLk
 bnO1sgAxlsPo6T+v9NM9aVa01BhZdL1CIN1Tu3EA7d8ShsitFYVsc56W+8U71DE41JFA
 08rYtYb7J8P+3yxotk6UqpMNmgu/aWMoIkybz0WiR+wL8SoHYJWh90vDOIxQhPf6Ao9v
 GCOsBmE0qj0urDi9gBnICYfY5lrsXT6CrxEaWjJjCX5AsYF26j/DJqJnk5evD3/dU2jj
 HCZU2MNR5OoHXC1rsg6dCXbrRRveciQ1KgHHbNqEpnDudO4ube8wWuF/2dMfHP8yiQTS
 SI3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767879985; x=1768484785;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kZU9D7A0bMPBh/K2lCh2in/vSVoKAdenRjv1onBswg4=;
 b=ezSN75pyJM08Qf4+3z628KQw+onyK77JAixrp9YkY+3X+6JpKUVu+uKkwjhXg4rL31
 1fIWHSa/HQqBkx0uspw3JKWL7wXyjI/HxtX/yv38G0kf624kGnWGkzeBNv1fOEZG6gPO
 KwT3sn23hbg+9aXOV85WTVHpX9fdcm8hDfzep8+Z8TvDKMfs9p4Ow1TXfQTifKFq898k
 xp7Y4RzA+nKp50nIoBJnxXjqqhPOCbNOViWBsD5YQ3QPvEpU3SOBiHY3gWjIygO5xaP8
 obaC3335gLU22r2LRPd2Zh4YW3DzzVTALK+0H3zId/sNlDiq7RYiKVLdX/bFomP9S2PM
 hk5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXYfR4f0dxKRIezi0zC1/yOGLOd4aOBEeplX4jCOz1u5xe9CxTa9fn9LAi2wF+njrb3QBzc/XeGu0c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzigKOv3iRK88l384Bx4DpNPK+qc1xAD/vTtjvW4N84hc7IT8RT
 6g3wr5t3ssFvBdPfCXkITNsxsnV16jblFtT16SN1bqt60HbDKiiUmN3L66XhD5XiVqVNsxmQsvn
 aLNevaiV1i1sAo6ifvghiLMXU7/1lObbUs3KJEbpIRdw29Umn0h3MQDhhHwfuTvxzxevDXE8=
X-Gm-Gg: AY/fxX5OxEEwgJY+fn4WWlKdfAONis0jRoMXWxlk0oq0vAtvBC6E0co1M4Oet4V+wjO
 zujDqvw6qCvuMzWESdzMzedUzHEMXSYYGhERS+QfpYP0suv8j9PsVl+H1g+drva3Dznox4rigJU
 5+BclfU+SjBtmhccvk1T6m5D0GyZqgLsU8ixG6t2yyLEWDKsl7pAEwdavvBx1Ocg+XwhB/AZruc
 /vxf8G8KRkj/O/oOR+X1cfmxsCSBUTuTLkcvcgXrMtd0AyR/YxhWA9Td8TVgqlqI34LC3kZqfGg
 Ptvfp5M2iAYaB060dXUtpZhkCihBbSKa6FJMvYzXELqq61tUqmqkQDswLG69Z1y1BhVDpr3uf+8
 hF15GXzLqIibX/xd6cXzNsi6ceTbigA/0DvPDXMg1DmzmDRGjKy2J/XPcggkYmRrylQvy5O3bGS
 UmRtHWDM5I2dsddljo/4eJ7E8=
X-Received: by 2002:a05:620a:2847:b0:8b2:e6e2:9a0a with SMTP id
 af79cd13be357-8c3893fd7f3mr888023985a.59.1767879984996; 
 Thu, 08 Jan 2026 05:46:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGyz41Dmq4KLKJe7ZgOODVgCo90nVtYDOjJYppi2nc41HLeTr6IbQ5JXvANeFFzPdqpXQ1PZA==
X-Received: by 2002:a05:620a:2847:b0:8b2:e6e2:9a0a with SMTP id
 af79cd13be357-8c3893fd7f3mr888018585a.59.1767879984471; 
 Thu, 08 Jan 2026 05:46:24 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-382eb8a9bd2sm16940871fa.29.2026.01.08.05.46.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jan 2026 05:46:23 -0800 (PST)
Date: Thu, 8 Jan 2026 15:46:18 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, jesszhan0024@gmail.com,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, neil.armstrong@linaro.org,
 konrad.dybcio@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 tingwei.zhang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
 yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH v5 10/12] drm/msm/dpu: Add Kaanapali SSPP sub-block support
Message-ID: <k2orlbxktyqhuuoievurde5vglpbx2qqhkbmnasfnefax6p4tv@7hhmnyomtxyy>
References: <20260108085659.790-1-yuanjie.yang@oss.qualcomm.com>
 <20260108085659.790-11-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108085659.790-11-yuanjie.yang@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: tjHk0-trhvvHl-AWHsEKMqTSzoPrBSQ1
X-Proofpoint-GUID: tjHk0-trhvvHl-AWHsEKMqTSzoPrBSQ1
X-Authority-Analysis: v=2.4 cv=DZEaa/tW c=1 sm=1 tr=0 ts=695fb531 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=GJ_0RPxpAChO0skCYF8A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA5NyBTYWx0ZWRfXyG+a9YQrxT2y
 2atlTOt30kbgt22KHgIEBZGsDRZ3LA7xAXns0wXVctezJzRstvMqPuktC8S0vfW9v8yjY3SOpU6
 LpCsacmbPP2ws9K2FsdGoSxNi+uA6eFYoQLtpXF5VK6QjIuD4Pv8lJXiHOpSroSBeqDpRh9Rgwu
 gkR0a5W8RCxAkts4o8FIWWAg5LAmRGgHXnOCU5b9ebO5nBNq6JwdRmTamYc+L2xyxby2W6bWVdS
 KjcOnn2ki9tVh+wC/rXm9LOdgROF4X5yy9TlDC9fCemoJPpCQCtk+D40o38Hdk4wb7LhAnWAaex
 hvQSWqxsZP/04BqLCRmR+c/ARPlj/2snis3qnk8k0V2lA1BcmT1eMrrWJZWo1iNnluBvaXJYqez
 8420IRSTMWHohM0IKZErP5ybL8fedL3wpjWOZ5w1IhwKIk5ftfUnYKAA7VrzDij2AnI//pdeRd3
 YqUmGNGoCzRRrz8SkkA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_02,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0 adultscore=0
 spamscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601080097
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

On Thu, Jan 08, 2026 at 04:56:57PM +0800, yuanjie yang wrote:
> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> 
> Add support for Kaanapali platform SSPP sub-blocks, which
> introduce structural changes including register additions,
> removals, and relocations. Add the new common and rectangle
> blocks, and update register definitions and handling to
> ensure compatibility with DPU v13.0.
> 
> Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/Makefile                  |   1 +
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  14 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   |  14 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   |   4 +
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c   | 321 ++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c   |  18 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h   |   3 +
>  7 files changed, 371 insertions(+), 4 deletions(-)
>  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c
> 

> +
> +void dpu_hw_sspp_init_v13(struct dpu_hw_sspp *c,
> +			  unsigned long features, const struct dpu_mdss_version *mdss_rev)
> +{
> +		c->ops.setup_format = dpu_hw_sspp_setup_format_v13;
> +		c->ops.setup_rects = dpu_hw_sspp_setup_rects_v13;

Wrong indentation.

> +		c->ops.setup_sourceaddress = dpu_hw_sspp_setup_sourceaddress_v13;
> +		c->ops.setup_solidfill = dpu_hw_sspp_setup_solidfill_v13;
> +		c->ops.setup_pe = dpu_hw_sspp_setup_pe_config_v13;
> +

>  /* QOS_QOS_CTRL */
>  #define QOS_QOS_CTRL_DANGER_SAFE_EN       BIT(0)
>  #define QOS_QOS_CTRL_DANGER_VBLANK_MASK   GENMASK(5, 4)
> @@ -475,6 +482,17 @@ void _dpu_hw_setup_qos_lut(struct dpu_hw_blk_reg_map *c, u32 offset,
>  		      cfg->danger_safe_en ? QOS_QOS_CTRL_DANGER_SAFE_EN : 0);
>  }
>  
> +void _dpu_hw_setup_qos_lut_v13(struct dpu_hw_blk_reg_map *c,
> +			       const struct dpu_hw_qos_cfg *cfg)

Will it be shared with other blocks (DS, WB)?

> +{
> +	DPU_REG_WRITE(c, SSPP_CMN_DANGER_LUT, cfg->danger_lut);
> +	DPU_REG_WRITE(c, SSPP_CMN_SAFE_LUT, cfg->safe_lut);
> +	DPU_REG_WRITE(c, SSPP_CMN_CREQ_LUT_0, cfg->creq_lut);
> +	DPU_REG_WRITE(c, SSPP_CMN_CREQ_LUT_1, cfg->creq_lut >> 32);
> +	DPU_REG_WRITE(c, SSPP_CMN_QOS_CTRL,
> +		      cfg->danger_safe_en ? QOS_QOS_CTRL_DANGER_SAFE_EN : 0);
> +}
> +
>  /*
>   * note: Aside from encoders, input_sel should be set to 0x0 by default
>   */

-- 
With best wishes
Dmitry
