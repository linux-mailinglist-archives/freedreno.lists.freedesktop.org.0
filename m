Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8BC4AC0BC4
	for <lists+freedreno@lfdr.de>; Thu, 22 May 2025 14:40:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96A9C10E706;
	Thu, 22 May 2025 12:40:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VgQalo+0";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 399CA10E846
 for <freedreno@lists.freedesktop.org>; Thu, 22 May 2025 12:40:15 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54M7OxmD021020
 for <freedreno@lists.freedesktop.org>; Thu, 22 May 2025 12:40:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=+EqEHGQsGLV7fMWgFHiDCICo
 9owZC5//Pie9xhLsJeQ=; b=VgQalo+0oOyORAiuezYHZYJqlNe7dZ4MnpprEVb9
 vwU8lKz3Z6m6Rli/ceqcyMqHNWDZTKZrwrQDJwEjJB9n+fQ46sFrHMYJy6UkK2oK
 Ic1SkaBhS3pPYcbwBAFu0JcGLJPjaIdpZdtUMH6kbvPKNcsvLCTCQXf+lal7bZ3N
 cWPNJJAgtyuEFAx4YeQ4+APzW/Gx9udZfw2ceEMM1W+v4rd2pz2qDK5tDkjtbBDK
 OuNfLY0VCMBLzk27BTvpEZFCX+YMR6tg21W1/OTTQ0HHCxHl0ZuKyCoMyJnTfEl3
 x0M0JcYU9q+VzC+xAp4bwjtdW7eHUWWOoG3bGigQivs1zg==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46s9pb4p03-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 22 May 2025 12:40:14 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id
 46e09a7af769-72ecb7f4b42so7735270a34.0
 for <freedreno@lists.freedesktop.org>; Thu, 22 May 2025 05:40:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747917611; x=1748522411;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+EqEHGQsGLV7fMWgFHiDCICo9owZC5//Pie9xhLsJeQ=;
 b=EQpvA8vnnHxqXnia0DPxv51XKCAsvCZ6iw9lwTzUuG4PoLyVK9MnA53hvbcqqY8lPc
 2yRHnN3RMQ2q01lwT/TJiiWwrWsa/NfBzGXEJu7pk0DJXHQoE/LvsMFPm503TihOvMX1
 4mN7XswvnayH4wfGoCP569upRQGpu0Dx43pb7Pc41RzDEHgr4uzNEX9hEe/Eqx+APmml
 LHN79aBKMBtkPir3AjOMk34QowRmv1/34GzTkMkaFCATbdVBxUBYS6uEpR7bNx0LjCld
 0xDhzSXJCFUjQ48CZ9Munh/O0nK8F0kFu7lMnE5FvfMrT60x7bnFWbC5FHhUGTsO2GKM
 26sw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXHEX2O/WRsni3JvSF/MBEzY34qRG0kM2XzxtRXuGaUq6J7xeqRrEgvipnFe72WsnCbd8sKt+j6Vu0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyF6I6cOX35LsQJxmqJyiJwbdJjQrNuU7IuFBS17I81+1wywrOj
 NKYlUmvlEryUaJnopv1R4ae9i1KFLj5eZDaZiCr25d2RVzM7/hGN9cpEbLBWxm8FZVWb+j09e6s
 7rKAOgmN2vc9tfyZyILGmHSR599HoAjcLcJgr0R+iY6nnOXJ5IvbxpjhaQqHbqGq6RKr8ITvizX
 h8IbE=
X-Gm-Gg: ASbGnctUSZFVHTnfj18ecCU26VfZZHi0yRmgM/BbxuMQXav3oCZdJ5Y/XetYnXf4PqC
 ordTmiteVMbEpNe446pQXuUo0BCf2uMDAc9Qiu4g+X7ElHTmqKi3r5SK58pw9cG3VD6dreEpAhq
 JugsySrCk/832ZEX8lziPTplAf/ttfXSSt/eHueXDwJgiaxWeESaQ0I+tmfC29eefWGi8P84Nu3
 53pqIXlyo/DYTziFRwOcCrKOAtQWefspF6WVRuSEV8ekAFiUZMTcsxzmWjqz2wP78fVmnxXjMB2
 zdMl2WPAK0cj6udaqr5zl8v1qs8V0aAWz0wm7TfC9hFigkF+mMIJzxo5axZOngAc6G/CbdOHfcw
 =
X-Received: by 2002:a05:6830:6118:b0:72b:9674:93e7 with SMTP id
 46e09a7af769-734f994c4eamr14759867a34.17.1747917611359; 
 Thu, 22 May 2025 05:40:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFve+8mofNSpVKLWwuMYBvia/xh0sTk8FAf6wyF/tDiY8jaMMruPUXYmConthQlvyqWvXyIXA==
X-Received: by 2002:ad4:5caa:0:b0:6f5:dd5:a594 with SMTP id
 6a1803df08f44-6f8b2cb94cemr428744686d6.5.1747917599863; 
 Thu, 22 May 2025 05:39:59 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e7017e6esm3376695e87.136.2025.05.22.05.39.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 May 2025 05:39:58 -0700 (PDT)
Date: Thu, 22 May 2025 15:39:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-phy@lists.infradead.org
Subject: Re: [PATCH v4 1/5] drm/msm/hdmi: switch to generic PHY subsystem
Message-ID: <tm2ogebkaxu3g6xdmrjkx3u6veac45qd7mtiruan4rcevs75xn@apubmfvg74nt>
References: <20250520-fd-hdmi-phy-v4-0-fcbaa652ad75@oss.qualcomm.com>
 <20250520-fd-hdmi-phy-v4-1-fcbaa652ad75@oss.qualcomm.com>
 <a42b9cbb-2f85-40c4-8b40-6f84970aba86@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a42b9cbb-2f85-40c4-8b40-6f84970aba86@linaro.org>
X-Authority-Analysis: v=2.4 cv=WJl/XmsR c=1 sm=1 tr=0 ts=682f1b2e cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=kkxXnT2X172yt9C4ahEA:9
 a=CjuIK1q_8ugA:10 a=eYe2g0i6gJ5uXG_o6N4q:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: ZXG_8EMEOFsMbRFIX3lCr9KtA-UDqebx
X-Proofpoint-GUID: ZXG_8EMEOFsMbRFIX3lCr9KtA-UDqebx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDEyOCBTYWx0ZWRfXxbgNPlH9oV3+
 2VgOAy3Yw6CJaXE5QbUlR3hNRK/kZAecgMEkBeMcQ2CajObVP+HsYMzCFP9DTPXjl8Xnaw/WL31
 pkF3tf/eCyOn3TBugRjkS9pFlkCmSKYV0OZqsMMLuBSL6/czLC2CcbfKEsWTAfh1L+rWu/Dn0FT
 6FS5bSPCgjnaFvXok8XbgHhfieBUG3SLVKJvH1t5psXW/8yKlTSXhWc62lKbGQJtCbjYoEpRMFL
 NHZm/nBJQmv26qUOfQUMjsLwLH43C7f49SSao2ur4TPv2MNkNTftKgY/fWicmUEjEkCCUtkL4A7
 q6+JHZuBmHtwrA593q1SH6K1hXzH9qQDUSx8CNv5+XtRDdQXD9lc6HU5Yfl0uaY7ucGBgQcLe81
 R7c26yzjdNZy3FeQOiE9ar1U6y/2lY+3Bg4q1NA8UkuG8LmWVB0zzpPJNzsfzkuZS/+mqR7O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 mlxscore=0 adultscore=0 phishscore=0
 mlxlogscore=999 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505220128
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

On Thu, May 22, 2025 at 09:38:34AM +0200, neil.armstrong@linaro.org wrote:
> On 20/05/2025 22:44, Dmitry Baryshkov wrote:
> > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > 
> > Change the MSM HDMI driver to use generic PHY subsystem. Moving PHY
> > drivers allows better code sharing with the rest of the PHY system.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >   drivers/gpu/drm/msm/Makefile                     |   7 -
> >   drivers/gpu/drm/msm/hdmi/hdmi.c                  |  58 +-
> >   drivers/gpu/drm/msm/hdmi/hdmi.h                  |  80 +--
> >   drivers/gpu/drm/msm/hdmi/hdmi_bridge.c           |  32 +-
> >   drivers/gpu/drm/msm/hdmi/hdmi_phy.c              | 225 -------
> >   drivers/gpu/drm/msm/hdmi/hdmi_phy_8960.c         |  51 --
> >   drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c         | 765 ----------------------
> >   drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c         | 769 -----------------------
> >   drivers/gpu/drm/msm/hdmi/hdmi_phy_8x60.c         | 141 -----
> >   drivers/gpu/drm/msm/hdmi/hdmi_phy_8x74.c         |  44 --
> >   drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c         | 458 --------------
> >   drivers/phy/qualcomm/Kconfig                     |  21 +
> >   drivers/phy/qualcomm/Makefile                    |  14 +
> >   drivers/phy/qualcomm/phy-qcom-hdmi-28hpm.c       |  71 +++
> >   drivers/phy/qualcomm/phy-qcom-hdmi-28lpm.c       | 441 +++++++++++++
> >   drivers/phy/qualcomm/phy-qcom-hdmi-45nm.c        | 186 ++++++
> >   drivers/phy/qualcomm/phy-qcom-hdmi-preqmp.c      | 212 +++++++
> >   drivers/phy/qualcomm/phy-qcom-hdmi-preqmp.h      |  81 +++
> >   drivers/phy/qualcomm/phy-qcom-qmp-hdmi-base.c    | 185 ++++++
> >   drivers/phy/qualcomm/phy-qcom-qmp-hdmi-msm8996.c | 442 +++++++++++++
> >   drivers/phy/qualcomm/phy-qcom-qmp-hdmi-msm8998.c | 495 +++++++++++++++
> >   drivers/phy/qualcomm/phy-qcom-qmp-hdmi.h         |  77 +++
> >   22 files changed, 2259 insertions(+), 2596 deletions(-)
> > 
> 
> <snip>
> 
> > diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> > index 53a7ce8cc7bc7b6278eae2cbc42c3fda8d697f6d..1a00c26c1b40fc81623c9fb22ba25f448c27bffb 100644
> > --- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> > +++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> > @@ -5,6 +5,7 @@
> >    */
> >   #include <linux/delay.h>
> > +#include <linux/phy/phy.h>
> >   #include <drm/drm_bridge_connector.h>
> >   #include <drm/drm_edid.h>
> >   #include <drm/display/drm_hdmi_helper.h>
> > @@ -286,11 +287,12 @@ static void msm_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
> >   {
> >   	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
> >   	struct hdmi *hdmi = hdmi_bridge->hdmi;
> > -	struct hdmi_phy *phy = hdmi->phy;
> >   	struct drm_encoder *encoder = bridge->encoder;
> >   	struct drm_connector *connector;
> >   	struct drm_connector_state *conn_state;
> >   	struct drm_crtc_state *crtc_state;
> > +	union phy_configure_opts phy_opts;
> > +	int ret;
> >   	DBG("power up");
> > @@ -304,7 +306,7 @@ static void msm_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
> >   	mutex_lock(&hdmi->state_mutex);
> >   	if (!hdmi->power_on) {
> > -		msm_hdmi_phy_resource_enable(phy);
> > +		phy_init(hdmi->phy);
> >   		msm_hdmi_power_on(bridge);
> >   		hdmi->power_on = true;
> >   	}
> > @@ -315,7 +317,23 @@ static void msm_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
> >   	drm_atomic_helper_connector_hdmi_update_infoframes(connector, state);
> > -	msm_hdmi_phy_powerup(phy, hdmi->pixclock);
> > +	phy_opts.hdmi.tmds_char_rate = conn_state->hdmi.tmds_char_rate;
> > +	phy_opts.hdmi.bpc = 8;
> > +	phy_configure(hdmi->phy, &phy_opts);
> > +
> > +	ret = phy_power_on(hdmi->phy);
> > +	if (WARN_ON(ret))
> > +		return;
> > +
> > +	if (hdmi->extp_clk) {
> > +		ret = clk_set_rate(hdmi->extp_clk, hdmi->pixclock);
> > +		if (ret)
> > +			DRM_DEV_ERROR(bridge->dev->dev, "failed to set extp clk rate: %d\n", ret);
> > +
> > +		ret = clk_prepare_enable(hdmi->extp_clk);
> > +		if (ret)
> > +			DRM_DEV_ERROR(bridge->dev->dev, "failed to enable extp clk: %d\n", ret);
> > +	}
> 
> Why do you again set the extp_clk since it's already set & enabled in msm_hdmi_power_on() ?
> 
> Perhaps I missed a change but it's like that on next-20250521

Yes. And it was a part of the series beforehand. I will check, why it
was required or I will drop it.

> 
> >   	msm_hdmi_set_mode(hdmi, true);
> > @@ -328,7 +346,6 @@ static void msm_hdmi_bridge_atomic_post_disable(struct drm_bridge *bridge,
> >   {
> >   	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
> >   	struct hdmi *hdmi = hdmi_bridge->hdmi;
> > -	struct hdmi_phy *phy = hdmi->phy;
> >   	if (hdmi->hdcp_ctrl)
> >   		msm_hdmi_hdcp_off(hdmi->hdcp_ctrl);
> > @@ -339,14 +356,17 @@ static void msm_hdmi_bridge_atomic_post_disable(struct drm_bridge *bridge,
> >   	mutex_lock(&hdmi->state_mutex);
> >   	msm_hdmi_set_mode(hdmi, hdmi->hpd_enabled);
> > -	msm_hdmi_phy_powerdown(phy);
> > +	if (hdmi->extp_clk)
> > +		clk_disable_unprepare(hdmi->extp_clk);
> > +
> > +	phy_power_off(hdmi->phy);
> >   	if (hdmi->power_on) {
> >   		power_off(bridge);
> >   		hdmi->power_on = false;
> >   		if (hdmi->connector->display_info.is_hdmi)
> >   			msm_hdmi_audio_update(hdmi);
> > -		msm_hdmi_phy_resource_disable(phy);
> > +		phy_exit(hdmi->phy);
> >   	}
> >   	mutex_unlock(&hdmi->state_mutex);
> >   }
> <snip>
> 
> Otherwise it looks fine even there's a lot to digest and hard to figure out
> the exact changes done to the PHY drivers.

Yes. I have been trying to find other ways to handle such move, but I
couldn't find any.

-- 
With best wishes
Dmitry
