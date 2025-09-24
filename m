Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F9ECB9B28A
	for <lists+freedreno@lfdr.de>; Wed, 24 Sep 2025 20:02:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD50610E7A8;
	Wed, 24 Sep 2025 18:02:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="aIsBhjhf";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5544010E7A8
 for <freedreno@lists.freedesktop.org>; Wed, 24 Sep 2025 18:02:09 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OCeVUq023770
 for <freedreno@lists.freedesktop.org>; Wed, 24 Sep 2025 18:02:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=pSWUBIP6OFTuLo6Z1De8G0wG
 CS7yFi6QHVszeQXIBZo=; b=aIsBhjhfmw75Lj2UmgwSjfiFQSyC5lTNEa0QzADr
 I0Tw8NoUyj6lGB7TDddj++G/U+DD2v5KJy2F54bHBz6sIl0qqPiTu0LUPguebZCO
 mdd1IVWYJ8PTVjddsRt+ZWR0RSF/+rpSBB4LiPz4svGae6c8SUb2wl9yVKjIgwmN
 dLr8f76/SfC1vtlC1yuXUHimv/4VhYGm/tGPp0ecxxZtgINrHwwUPD7c2KMmXVQv
 gPbqgkvtvcHfYPaBUhc36zcXniMG46eZ44RpQ7wNVWfuIPB5sdEw07SED3b4TGGh
 BB5qrISaYMPG5hrwvJqDgmlyq52/jBkZtr4FZBh9y8pnNg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bwp0caxh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 24 Sep 2025 18:02:08 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-268141f759aso638515ad.2
 for <freedreno@lists.freedesktop.org>; Wed, 24 Sep 2025 11:02:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758736927; x=1759341727;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pSWUBIP6OFTuLo6Z1De8G0wGCS7yFi6QHVszeQXIBZo=;
 b=oSuePw/Fg94KftUGWI20dgIhO2PxIQLNMv+eCu2SfFyHtNMcYIlpVZ/hjC673n7wb2
 fhFGwKndHVXX/ilHez0jHGUKMYZJ+d5+fYrVjoFXm2roQ0cHWKijXR/5Y1jjOu1MeyUJ
 5tUNa1Ymy4GYVEHO3D8cIScP3cyGbv6yyANCevN3diRPXIy1lu4iKOUglJGiMmZ/w8xA
 b+T5EC9EhuKEnw9j0EgPXsXQMpvQF7R6U8r2H9Q8gf9BaFbgt5jn1ps7w5PxxuMVB95t
 hPddQLhbGJHYkzxhqxWKB6Rc6rMmQoQpbG/eYJLi3z4MLgkyC1AcKGX0rh936DxFygwh
 7pIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMSdHZn8Zp7TXb0NM/YTIbXFbQ7f7QoOrZx/woxjTZwE7cnEu6Vr/zOTyLeCQc7JZ0g1D8dBHe/78=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxtNjNBiy/k2quxdtbzuxKbx8cw7wc/MICAgFct+f6cnp9UepvO
 48er5UzBieT6yoYZuTkis9P9++cPb/nOGm1P801mZoSKzNpG7g6zds8zqNFGbH2iAi5AwtTv8cj
 CIHQEC9NqgpaWDTJ+beNbpPuEEzA++mzQw4FtSY4Qbz1KWClPjCbkmQLV0RyD6+jau8sY/YS0Nl
 lrDYwUlQaCzQ1wyXI4MKnt+8dvdkXu7PQXEywqcasSdgh7iA==
X-Gm-Gg: ASbGncvkVZkdDt69NGUFzQyQ9YmhhTUkhs1zYkMDsMo0C4jOFYn+m22/6jEfW8OY+tF
 LfMl4e+xCSsYwfTZQPuc41jvCFXBvKSVIsOryLDqoThtY2XtGczu02Zd8OctuC59GL7gtTYi3H+
 DPMrDs+Ig9XcpgNMbXL1+Vht8LLZbaWz/ovnjc7jdQTXgR5VYfilizKA==
X-Received: by 2002:a17:902:fc48:b0:246:80b1:8c87 with SMTP id
 d9443c01a7336-27ed4a4974fmr8989625ad.43.1758736926921; 
 Wed, 24 Sep 2025 11:02:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF5VmtuJaJ4FUTe+FfHtk0uwoMs69qvC4ZVktOshLxRHet1WOOLGg/pw6UxmNBmfwikkG9MfLRfsTbV6YrLk6w=
X-Received: by 2002:a17:902:fc48:b0:246:80b1:8c87 with SMTP id
 d9443c01a7336-27ed4a4974fmr8988525ad.43.1758736926053; Wed, 24 Sep 2025
 11:02:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250924-dsi-dual-panel-upstream-v3-0-6927284f1098@linaro.org>
 <20250924-dsi-dual-panel-upstream-v3-2-6927284f1098@linaro.org>
In-Reply-To: <20250924-dsi-dual-panel-upstream-v3-2-6927284f1098@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 21:01:54 +0300
X-Gm-Features: AS18NWCTdNjmJ2KpP_0NKcgbLpYWYdnYEoHnk-FxT_mIPh1RGl91Lr1OC3FQLOM
Message-ID: <CAO9ioeW2AHDM3KSRu-WOvy+1De9tqfhrCNozw5Wkh=CJDHxFYg@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] drm/mipi-dsi: Add flag to support dual-panel
 configurations
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=KNxaDEFo c=1 sm=1 tr=0 ts=68d43220 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10
 a=KKAkSRfTAAAA:8 a=JmB1tVOSonE3mgEak7wA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: pY7OltVnPxci88UTu3A2lsQHzgsyJC5m
X-Proofpoint-ORIG-GUID: pY7OltVnPxci88UTu3A2lsQHzgsyJC5m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDEzOCBTYWx0ZWRfX0eEtP6glSTRM
 Hd3OEDnU7frMM+8sglSyhGFiLdJsVdmWvzLY5KaX63gCCR9l/oMkkYxN1e6mt20dPX0BopDmvcz
 i4iDAMUtRv8bXnocp+NDiF+pJzyzUeS4p+vY1nGyr5T369egO5hlQcecBlpB8W2K8AkzbjijDLF
 AtSo11LVr98Dv8bmRzJissW/alfHs9PJ6LOGEgzW+wwE4vwIK/LE21M+O9LdUmwGLFfzOEGTv6p
 6X3Sp+OoPEMRcMi3WuO3pWbrle/TGyjfbxuANnu7juMhL5c8+c2+42GqvZqdbOoLqPIxRNx6WxL
 cLZXNheFvVIhdI7G+3IvtFwIUkCkdl3rsgfbKzfdHocENKWNiUWG6PBQefPe91ZnnFPwYelKsJC
 U+0wcWrs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_04,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 clxscore=1015 phishscore=0 suspectscore=0
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509230138
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

On Wed, 24 Sept 2025 at 18:08, Jun Nie <jun.nie@linaro.org> wrote:
>
> Some devices treat two independent physical DSI panels as a single
> logical panel from the CRTC's perspective. However, two separate DSI
> hosts are still required to drive the panels individually.
>
> Introduce a `dual_panel` flag to the `mipi_dsi_device` struct. This
> allows a panel driver to inform the DSI host that it is part of a
> dual-panel setup, enabling the host to coordinate both physical
> displays as one.

How is it being set?
>
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  include/drm/drm_mipi_dsi.h | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
> index 5a85ba01f402a3866b70828391bb417bb8dd5956..0faff285d9ffeb19e4523cdc7bf21c1ec20e6eff 100644
> --- a/include/drm/drm_mipi_dsi.h
> +++ b/include/drm/drm_mipi_dsi.h
> @@ -170,6 +170,7 @@ struct mipi_dsi_device_info {
>   * @host: DSI host for this peripheral
>   * @dev: driver model device node for this peripheral
>   * @attached: the DSI device has been successfully attached
> + * @dual_panel: the DSI device is one instance of dual panel
>   * @name: DSI peripheral chip type
>   * @channel: virtual channel assigned to the peripheral
>   * @format: pixel format for video mode
> @@ -188,6 +189,7 @@ struct mipi_dsi_device {
>         struct mipi_dsi_host *host;
>         struct device dev;
>         bool attached;
> +       bool dual_panel;
>
>         char name[DSI_DEV_NAME_SIZE];
>         unsigned int channel;
>
> --
> 2.34.1
>


-- 
With best wishes
Dmitry
