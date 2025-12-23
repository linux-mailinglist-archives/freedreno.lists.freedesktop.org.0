Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38BDCCD7F65
	for <lists+freedreno@lfdr.de>; Tue, 23 Dec 2025 04:24:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D37DD10E055;
	Tue, 23 Dec 2025 03:24:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="EWQXOyJK";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gYHHjOzA";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52B3510E0C8
 for <freedreno@lists.freedesktop.org>; Tue, 23 Dec 2025 03:24:19 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BN2RJZV2198818
 for <freedreno@lists.freedesktop.org>; Tue, 23 Dec 2025 03:24:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=uzcjLJXc2097V0w9Cw9cP1j+
 FnVN5njS+BUALgshRFw=; b=EWQXOyJKyJLKA3nSByDu2f6FBVBpNRduaHvWDXnX
 dsxzjTxIIGa+mQwrFtw4KyWyFFXVsyVfxYA2pEAWIcCG7IJbDTPBORbrXGhkPf8X
 hRr1xYqxbNi594tkjhR/Bvox9qF8TpsJ35xnVrF2GdCD1g7kTM0GwZPh1k7mbdU4
 jA/ZImrzf1T8UEWZxHrF7rSKWSMeGablIn6j030gHJ47IgvGMTzrMpoihZ9MkA9D
 RNofz/HLuqbLP1TEkEVjScO+CBnb8TehyiA9dt4EQYNjVASXqvieCfrxM7RRFbE4
 DoIni263VeJwrFD6dNYWDFSeWsJ/GdxLkYbwXi+nbjsajA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b73fwtkvu-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 23 Dec 2025 03:24:18 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8b2e9b2608dso946528985a.3
 for <freedreno@lists.freedesktop.org>; Mon, 22 Dec 2025 19:24:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766460258; x=1767065058;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=uzcjLJXc2097V0w9Cw9cP1j+FnVN5njS+BUALgshRFw=;
 b=gYHHjOzAZ5TvGbq+uiB4zKScRLOP387XR3jwUr9Tj79TWN3+qraXXm2IPjGIpKsngP
 XH0FUP9FdO1kvw4UPYKmnjBsqnYyOR2gqIxBq7m7+wZQafU7S49waQ+iBQD/9W+ZQ1vW
 1GtK1DPhD0p2ipgqEbGvF4/6MG7Y84NIrJADzOckUhuRbqU6qqTA2jMxcm5a6S+2eoWQ
 dW/+HVLutSZ57L3513ApSsm4YByFgJBz3KNr6S5iJEMUaXpcS84kOSMn6ovJL5+iixax
 CApbtNYTIg4pQyNw4CJ+gZ1cmnYcQr6SrHR2LZz5kfkkyCJVqQoX/aFk0l4iV48WWZ40
 5/LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766460258; x=1767065058;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uzcjLJXc2097V0w9Cw9cP1j+FnVN5njS+BUALgshRFw=;
 b=Fw6C+QgRZxx+EIGsaP1kbyVFdVi9clAGE7pSpDW1ekDkmHdwQ1PsWEGwXc4VHPLBdY
 /ReLa0nIOtE7+3AVl9WRHys7kVykpinMKGqOTfmUJxCbc3KeLXRfjQkAyXSHKA1KYhOP
 M4tArGy5Nr2R9PokagOE5OUmHoKy4+gqAQEQDgPYhINezVZ+15HbQ5lhHlWFYRDQvsKN
 h0hcsurJH/vMFsgsFpH28V0lt3NOjIy/rTuqdNj1kyxH2HjX0SbsPL0VUraBeaCwTaZi
 mLnBuc3wheKTKZk1v+bcOfqu4BumdHkUlJgPGbrrAAaoqS1CNrdFYGyL2e2+VPw3n5yp
 E9kA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtie7SuIuTClg5vuAoapbIhwge7EGv3BJUiHbQQzkkboR08X7mVZ2crmzUHV8BSpaie8IvPg5CxAI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy16mrqmJvEPW7sa1G4zJ6l7GJNrA1gFeafXf3MuvOUkRdL0fsN
 hzqYPWURPXiFR8BAGfZUOvJ5O7nl1Mmgp84gUa9qNLcn/vipdYrba+yMt644/gXq4tUyV67df9z
 1fy5Rh8ALT9hq8kOOan1sKypvFbvKMxRzlutFfYkegORH8fqM/bSVriCHaG+RiSzA0m56qnY=
X-Gm-Gg: AY/fxX4RO/x4r6fyQK7kTg+skM5yjIgGEnREcWyPQ8O7aoaRcg5iNggBG82bGUrwDda
 NxGa59lgyXuSHJDpo93c2PrLHlm7FKq3vuh16gPY8vFniDe01jeLr07P45Ee5pSdmwU5Y2wAdWU
 xye+gCU6DUsp80OP1XZIrs+zquIs4UkD+xAe4jdpufTmEuwF+9Leu0UfPaCkUbFITtqsJ9J/M6R
 /QMIzHQ/wBLGWHSEsgezxMp5sEY5n5glYechmJTB0gvHtqJLeR5KlR5ajhucN8M91LB4/0UqcvM
 rLu16uO7Ys2FC7u3g2QOmyR2Xla2HnFaubHErOa4pwxs6XunxIH4QGv6v5isjrqGVosY/cS26f8
 QGWYn6wJVtgxJDOKZRGOFyRWQQwTIwJbIJ4CwCadsPUuE2WLzSKTE0SsKAQYMHaWpwnwkAVU=
X-Received: by 2002:a05:620a:1994:b0:86e:ff4e:d55e with SMTP id
 af79cd13be357-8c08fbeede2mr1932867985a.39.1766460257523; 
 Mon, 22 Dec 2025 19:24:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF/40QROaFLK1fYdvlaAHuTUed6JCbRW9u2WF6S4Bjewg4/g/lNx6JVpUfjFC154rXkAZ7GkQ==
X-Received: by 2002:a05:620a:1994:b0:86e:ff4e:d55e with SMTP id
 af79cd13be357-8c08fbeede2mr1932865185a.39.1766460257054; 
 Mon, 22 Dec 2025 19:24:17 -0800 (PST)
Received: from yuanjiey.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8c0968933d3sm972273685a.22.2025.12.22.19.24.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Dec 2025 19:24:16 -0800 (PST)
Date: Tue, 23 Dec 2025 11:24:05 +0800
From: yuanjiey <yuanjie.yang@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
Subject: Re: [PATCH v4 00/11] drm/msm: Add support for Kaanapali
Message-ID: <aUoLVVDaEvx7jMwM@yuanjiey.ap.qualcomm.com>
References: <20251222102400.1109-1-yuanjie.yang@oss.qualcomm.com>
 <CAO9ioeVXqVJ=d1xArUJOfz89o0UTVMcUZknMpHSZ-k4RCTZK3Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAO9ioeVXqVJ=d1xArUJOfz89o0UTVMcUZknMpHSZ-k4RCTZK3Q@mail.gmail.com>
X-Authority-Analysis: v=2.4 cv=ELgLElZC c=1 sm=1 tr=0 ts=694a0b62 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=qC_FGOx9AAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=JB2G29MalyZ09vBlPV8A:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDAyNiBTYWx0ZWRfX4BCfYFPWsdSt
 VktW5LTw93vKdVunMMhNvKl4xZ8UVHLULIQXMzTssq+87zjRPFz0s2uCvDQqHSJSt2TP7lLrBAM
 QnGk+4SZ5pZgDZ816iidVSAkN5b6fsL+23VJSv1h+lTC+ni5AaSa/KUvFqpLnI4zK3yYv47vLi5
 QxtomHd/kGwgaK1J06Ej3mc7TO+dCHnfiYIPKaJPDn4AhXn59eg4T9OonKou7A8mUNTi1/bw9d5
 Zhcn4u0qMpjk4enmsxefLIduV6EpbnW/JZfK5l0Elm0qU/1srbK7Gr9btxeR2k72a9gEMye/wEA
 jtEgHwW0LeyFoO0kAVzD63dqQyzcdeBLegduDEF2lmd4niJ1aYOrh8oSYRuW7OvWpiTe2HZbvJy
 yElp1TRc0VUSldC/6eAZ4FHwHYQZXVEFpNY3ri6DY5RMhwJ6Nn+yYiCGpUKMZu3rC4pNENGsacq
 V3fbexuDbBGUq/Nbvlw==
X-Proofpoint-GUID: e4N7GALhn2oUs0d3C9CXeiAiepwbdfWg
X-Proofpoint-ORIG-GUID: e4N7GALhn2oUs0d3C9CXeiAiepwbdfWg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_01,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0
 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230026
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

On Mon, Dec 22, 2025 at 02:02:52PM +0200, Dmitry Baryshkov wrote:
> On Mon, 22 Dec 2025 at 12:24, yuanjie yang
> <yuanjie.yang@oss.qualcomm.com> wrote:
> >
> > From: Yuanjie Yang <yuanjiey@qti.qualcomm.com>
> >
> > The Kaanapali MDSS has some differences compared to the SM8750 MDSS:
> > - DSI PHY/DSI base address have some changes.
> > - DPU 13.0:
> >   - SSPP layout has a great change.
> >   - interrupt INTF layout has some changes.
> >
> > This patchset contains DSI PHY, DSI Controller, DPU & MDSS bindings
> > in addition to the driver changes.
> >
> > We have already tested the display functionality using the Kaanapali-mtp
> > device on the Kaanapali branch of kernel-qcom repository.
> > Test command: "modetest -r -v"
> > kernel-qcom repository: https://git.codelinaro.org/clo/linux-kernel/kernel-qcom/-/tree/kaanapali
> >
> > [PATCH v4 05/11] drm/msm/mdss: Add support for Kaanapali
> > compile depend on qcom-soc tree patch: https://lore.kernel.org/lkml/20250930-kaana-gpu-support-v1-1-73530b0700ed@oss.qualcomm.com/
> >
> > Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > ---
> > Changes in v4:
> > - fix qcom,kaanapali-mdss.yaml compile error
> > - reorganize SSPP patch order
> > - fix Dmitry ohter comment
> 
> Which 'comment'? Please be specific in the changelog.
fix SSPP space issue.
fix MDSS UBWC issue.
fix commit msg kaanapali -> Kaanapali.
clean refactor SSPP patch and SSPP V13 patch.

will be careful later.

Thanks,
Yuanjie

> > - rebase on top of msm-next
> > - Link to v3: https://lore.kernel.org/all/20251215083854.577-1-yuanjie.yang@oss.qualcomm.com/
> >
> > Changes in v3:
> > - split SSPP refactor patch
> > - add devicetree email list
> > - fix Dmitry comment
> > - rebase on top of msm-next
> > - Link to v2: https://lore.kernel.org/all/20251125064758.7207-1-yuanjie.yang@oss.qualcomm.com/
> >
> > Changes in v2:
> > - Drop panel patch
> > - adjust patch order (bindings then drivers)
> > - add dpu_hw_ssppv13.c to complete kaanapali SSPP function
> > - fix bindings example dts compile error
> > - fix other comment
> > - rebase on top of msm-next
> > - Link to v1: https://lore.kernel.org/all/20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com/
> >
> > ---
> > Yuanjie Yang (11):
> >   dt-bindings: display/msm: qcom,kaanapali-dpu: Add Kaanapali
> >   dt-bindings: display/msm: dsi-phy-7nm: Add Kaanapali DSI PHY
> >   dt-bindings: display/msm: dsi-controller-main: Add Kaanapali
> >   dt-bindings: display/msm: qcom,kaanapali-mdss: Add Kaanapali
> >   drm/msm/mdss: Add support for Kaanapali
> >   drm/msm/dsi/phy: Add support for Kaanapali
> >   drm/msm/dsi: Add support for Kaanapali
> >   drm/msm/dpu: Add interrupt registers for DPU 13.0.0
> >   drm/msm/dpu: Refactor SSPP to compatible DPU 13.0.0
> >   drm/msm/dpu: Add Kaanapali SSPP sub-block support
> >   drm/msm/dpu: Add support for Kaanapali DPU
> >
> >  .../display/msm/dsi-controller-main.yaml      |   2 +
> >  .../bindings/display/msm/dsi-phy-7nm.yaml     |   1 +
> >  .../display/msm/qcom,kaanapali-mdss.yaml      | 297 +++++++++++
> >  .../bindings/display/msm/qcom,sm8650-dpu.yaml |   1 +
> >  drivers/gpu/drm/msm/Makefile                  |   1 +
> >  .../disp/dpu1/catalog/dpu_13_0_kaanapali.h    | 492 ++++++++++++++++++
> >  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |  41 ++
> >  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  15 +
> >  .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c |  89 +++-
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   | 123 +++--
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   |  56 ++
> >  .../gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c   | 321 ++++++++++++
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c   |  18 +
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h   |   3 +
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c     |  17 +-
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   1 +
> >  drivers/gpu/drm/msm/dsi/dsi_cfg.c             |  13 +
> >  drivers/gpu/drm/msm/dsi/dsi_cfg.h             |   1 +
> >  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c         |   2 +
> >  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h         |   1 +
> >  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c     |  23 +
> >  drivers/gpu/drm/msm/msm_mdss.c                |  10 +-
> >  22 files changed, 1474 insertions(+), 54 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml
> >  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_13_0_kaanapali.h
> >  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c
> >
> >
> > base-commit: 06aa394d58c11406569bcbd4a69b81290edf3f63
> > --
> > 2.34.1
> >
> 
> 
> -- 
> With best wishes
> Dmitry
