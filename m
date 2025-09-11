Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07EF5B53656
	for <lists+freedreno@lfdr.de>; Thu, 11 Sep 2025 16:52:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D500110E37A;
	Thu, 11 Sep 2025 14:52:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="X1srIZVf";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 631D910E379
 for <freedreno@lists.freedesktop.org>; Thu, 11 Sep 2025 14:52:07 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BB0bd9002634
 for <freedreno@lists.freedesktop.org>; Thu, 11 Sep 2025 14:52:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 WojJDvsX9kdVKAnNSnxIU1th8+eZ8pVWigC6PBhk65c=; b=X1srIZVfXz6frseC
 6UVh+E42QctEW94Jng3VYLFtPsGhJRQxZ1/kA5u7hea2LzIlpzCxsdkFGSKCkIiJ
 y0NnJuSwT8mize+yh3H1ofS7h6d6GEzgCEaJLsGUcMLuL1XsoL8jqL6y95WEjrlt
 2/v//VyQKQzTha71IUGgaqZOO/YJjsXBA2lNdT+/OAAmDK60OkqYjWz3yVapU/x9
 Ov9Xmp4RH+xrjoLwYITHfp34X2rRBQMZxL+dSDT22TI434vHkksmBkOrm/eNwLD6
 AI1ToTY1zy63cW5AI+dH5KAILpeOj7B0HJ6NK5kx+hTcwREQmiy+p1f7Lo8QJC6x
 NeRLwg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490bwsg9ft-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 11 Sep 2025 14:52:06 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-25c7d8164a8so1215165ad.3
 for <freedreno@lists.freedesktop.org>; Thu, 11 Sep 2025 07:52:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757602326; x=1758207126;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=WojJDvsX9kdVKAnNSnxIU1th8+eZ8pVWigC6PBhk65c=;
 b=Nlx4sC/DiyqAgaxwBvKGdns8unXXt4adSaHO9NHOD6Rlbt+22DM3W2jZUeNFcMow3F
 R1SrtxHpsiVjLRZV8e1pTaJUCxrkqyjOYgP6XdfjNrzFSbObqbNzR6BBTTlerb0ebStW
 n9D/NIe7FZ6yNCIBXA1AqXe+EVZJZoMbYLFpb+erxp4cXFCdNk2V/vx7nf8YJ/PUFqJg
 YwrmYT3gpx70RhS8EaM+7IdcxP0ERSKR/Qt4wTu3/Zl+yRp7nFfbh7Wd7aNxPR1P+h0P
 pNPB67Vs31NZjfKf1OvX63XPhcGTIdtIGw/0C5lXC4L/1dKLTRH9xkT37ECO5u3eVW2o
 WLjA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/4jMXS69gBfwrbFAQOT0QOtUNot+t5a5NkvjZts9xdEPUFphC6DZ0ynctqqAnMnhIyvFnkviZ1bM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YytpIEWm5ewHiP723EvCKAMTGftDqELYw8k2AkUkTDPrrr/+KjI
 YLoc++fBj6B7bhBpnw/tlVG0azuWuJOHI+Nu4PvxKaSR45ytdG/aCfVYq3M2NhVZ+KChIlL81p0
 9dQ3GLDCS+jPe5cj4Wtm8MGsPaBtW5RCulwQN3tkZTVQtAnl5IUbVhLTPNq08Pt/HzKk1Rfc=
X-Gm-Gg: ASbGnculi78O8qZ29aYagXB8+EgOdi/p/k6SptxPLVGp00Mj5hU5fonJQIe0ITNG0Js
 zZXGtjxa84CpnEJN0RkayHT299ADOsThpHi6pHYOLEQxUGuJFs9iiy98poZdkrg0NaPpSTQ6JZx
 vX+1Mnh+xITAimhj+f0l4h+bEzXShXLSYctIk0jWtZCmz2DeKZiUyO1rh2EcN2JJxYogGU+40Au
 PjAdJej1Z1A2dMFTqLw+GYwQwsR9fkDkJXBgLadb995o3DFwjvIAfnX/hreZVJMUtuaIPJg1E+f
 C4QXw7ssc+FPQOFPk8DwdLfy3dz2Hq126z4Sw42hYBnGkz4rGwNgmAtCIDQfuFFKk1ZrlAi+NBg
 35CUkywUVnIKgAY6tHL2nMcxdwFFARw==
X-Received: by 2002:a17:902:ce83:b0:24c:b36d:637 with SMTP id
 d9443c01a7336-2516ed66eb6mr141725395ad.1.1757602325773; 
 Thu, 11 Sep 2025 07:52:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGT+PRAiEdvkLjcRfWqdV9jt0LLP+pDcy5hdt4QkW8ZMuAA0nniD4jnVIYnBcIAtmyR2ZAHuQ==
X-Received: by 2002:a17:902:ce83:b0:24c:b36d:637 with SMTP id
 d9443c01a7336-2516ed66eb6mr141725245ad.1.1757602325286; 
 Thu, 11 Sep 2025 07:52:05 -0700 (PDT)
Received: from [10.133.33.174] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-25c3ae28408sm21345695ad.109.2025.09.11.07.51.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Sep 2025 07:52:05 -0700 (PDT)
Message-ID: <33137dc3-254e-4a7e-9531-8d682692fe29@oss.qualcomm.com>
Date: Thu, 11 Sep 2025 22:51:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/13] (no cover subject)
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 li.liu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
References: <20250911-add-displayport-support-for-qcs615-platform-v4-0-177348170c2d@oss.qualcomm.com>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <20250911-add-displayport-support-for-qcs615-platform-v4-0-177348170c2d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: CORE65w2j26NK8ntqW7OeUt6yBzHNXOL
X-Proofpoint-GUID: CORE65w2j26NK8ntqW7OeUt6yBzHNXOL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfX0to6PvMPHTM3
 pklyvFRCxJ2AVtPr+3Vgh93CG6OmKUa3ihowSljBse9f9m0fYQA7xUSsw8mmbDnFfHPxPbx1XlT
 +D7+8nGO5cWP9SFCYk7nslVDAAPI42QCpM00JZXrlZ62yuHwACYiQaYQ1QHMeZ6d/TJKPdXdX67
 w0ps+qbfMyafjt/ZTm6LJTrxkej/oZpsQJMhy0eZco0C7xHLJ/Er3EAMjtJzryaz0GCb6LLseGr
 H7EMa9r8v+Py70BIOFC4a/XITPqYOPfEfoKTeM5gqXCFWHTApah8c8xJtnmt9xFcNqXEs967L5y
 wKNAoA40dbaqmjzb09MCKpLKX4mku53bqAhq1f+osc440WON5aXrPmLmEw3RbsRF75HA4YdHHYh
 np9NwYhR
X-Authority-Analysis: v=2.4 cv=G4kcE8k5 c=1 sm=1 tr=0 ts=68c2e216 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=BiXlWXQ3g7YhofqwlSUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-11_01,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060018
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

Sorry for miss subject and will resend later.


On 9/11/2025 10:46 PM, Xiangxu Yin wrote:
> This series aims to extend the USB-C PHY to support DP mode and enable
> DisplayPort on the Qualcomm QCS615 platform.
>
> The devicetree modification for DisplayPort on QCS615 will be provided
> in a future patch.
>
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
> Changes in v4:
>
> - Drop patch v3[01/14 & 13/14], will sutbmit new patchsets based mst dt binding series.
> - Update maintainer of qcom,qcs615-qmp-usb3dp-phy.yaml to myself.
> - Add missing aux and pipe clocks. [Dmitry]
> - Drop second TCSR phandle; register offsets are described directly. [Dmitry]
> - Add USBC PHY series related init_load_uA configs. [Dmitry]
> - Drop v3[04/14] qmp_phy_usbc_type define and use dp_serdes offsets to confirm DP capability [Dmitry]
> - Reorganize sub-patches as suggested.
> - Link to v3: https://lore.kernel.org/all/20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com/
>
> Changes in v3:
>
> - Renamed qcom,qcs615-qmp-dp-phy.yaml in v2 to qcom,qcs615-qmp-dp-phy.yaml in v3 for QCS615 USB3+DP PHY.
> - Updated patch v3[02/14] to revise binding title, description, and property order. [Krzysztof]
> - Updated commit messages in patch v3[01/14] and [13/14] to reflect the DTSI rename and clarify compatibility. [Krzysztof]
> - Added USB3+DP mode implementation in patches v3 [003–012], organized in logical chunks. [Dmitry]
> - Dropped patch v2[03/13] to maintain full backward compatibility with USBC.
> - Link to v2: https://lore.kernel.org/all/20250722-add-displayport-support-for-qcs615-platform-v2-0-42b4037171f8@oss.qualcomm.com/
>
> Changes in v2:
>
> - Add new binding qcom,qcs615-qmp-dp-phy.yaml for QCS615 standalone DP
> - Split DP PHY driver into patches 4-11 by logical chunks [Dmitry]
> - Update DP PHY configuration flow to align with QMP Combo PHY implementation [Dmitry]
> - Update all hex values to lowercase [Dmitry]
> - Remove redundant comments in DP PHY driver [Krzysztof]
> - Remove invalid USBC type define [Dmitry]
> - Move lane_map， max_dp_lanes， max_dp_link_rate parsing logic to dp_link [Dmitry]
> - Add TCSR-based mutex logic for DP and USB PHY coexistence [Dmitry]
> - Drop patches 6–8 and remove related binding properties as rejected upstream
> - Link to v1: https://lore.kernel.org/all/20241129-add-displayport-support-for-qcs615-platform-v1-0-09a4338d93ef@quicinc.com/
>
> ---
> Xiangxu Yin (13):
>       dt-bindings: phy: Add QMP USB3+DP PHY for QCS615
>       phy: qcom: qmp-usbc: Rename USB-specific ops to prepare for DP support
>       phy: qcom: qmp-usbc: Add DP-related fields for USB/DP switchable PHY
>       phy: qcom: qmp-usbc: Add QCS615 DP PHY configuration and init data
>       phy: qcom: qmp-usbc: Add regulator init_load support
>       phy: qcom: qmp-usbc: Move reset config into PHY cfg
>       phy: qcom: qmp-usbc: Add DP PHY configuration support for QCS615
>       phy: qcom: qmp-usbc: Add USB/DP switchable PHY clk register
>       phy: qcom: qmp-usbc: Add TCSR parsing and PHY mode setting
>       phy: qcom: qmp-usbc: Add DP PHY ops for USB/DP switchable Type-C PHYs
>       phy: qcom: qmp-usbc: Add USB/DP mutex handling
>       drm/msm/dp: move link-specific parsing from dp_panel to dp_link
>       drm/msm/dp: Add support for lane mapping configuration
>
>  .../bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml   |  111 ++
>  drivers/gpu/drm/msm/dp/dp_ctrl.c                   |   10 +-
>  drivers/gpu/drm/msm/dp/dp_link.c                   |   71 ++
>  drivers/gpu/drm/msm/dp/dp_link.h                   |    5 +
>  drivers/gpu/drm/msm/dp/dp_panel.c                  |   78 +-
>  drivers/gpu/drm/msm/dp/dp_panel.h                  |    3 -
>  drivers/phy/qualcomm/phy-qcom-qmp-dp-phy-v2.h      |   21 +
>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c           | 1089 +++++++++++++++++---
>  8 files changed, 1192 insertions(+), 196 deletions(-)
> ---
> base-commit: 8f21d9da46702c4d6951ba60ca8a05f42870fe8f
> change-id: 20250911-add-displayport-support-for-qcs615-platform-2f072e2ba239
>
> Best regards,
