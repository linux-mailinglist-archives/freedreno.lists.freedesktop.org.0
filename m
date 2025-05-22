Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1CEBAC0BB9
	for <lists+freedreno@lfdr.de>; Thu, 22 May 2025 14:39:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36F0A10E82F;
	Thu, 22 May 2025 12:39:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="jchA7C/t";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 436D110E747
 for <freedreno@lists.freedesktop.org>; Thu, 22 May 2025 12:39:03 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54M7VkKa006644
 for <freedreno@lists.freedesktop.org>; Thu, 22 May 2025 12:39:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=19244OeHzQNxf5SDPlapadMw
 0CElU62/QrqnAm04GGQ=; b=jchA7C/tYzQs3FSMKQFxdC+2jE3n4zIlVl/HdbX9
 n8tskfMryHGAmKxZ6NN8UAkxanofJJ1VJnP1CthR+8hAOE3UosADh9y9xCNSzMYk
 j0kZr37FN7+gTunVFYJu7rbofO1TOObyb0HrLl+tdJFy8wBSZ3MOhF/G6v1+iLOm
 h/arkBxRSwvR7USQsmLjjupau1ElYP7fqal2xhnEy00Dkqa1Bylmjz8VNkk48wsZ
 BAySQnq/YOExshiMcnDGfxX80OFBWRSfB7VHW02Di04MnD4abWSuFEzvy1LlP/lX
 pki7Pnd6/fAW8sv4iQBCRvzzDyeyYHF0ZJqBP+gUeTpVmA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf0pe10-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 22 May 2025 12:39:01 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6f8e23d6657so67953096d6.2
 for <freedreno@lists.freedesktop.org>; Thu, 22 May 2025 05:39:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747917540; x=1748522340;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=19244OeHzQNxf5SDPlapadMw0CElU62/QrqnAm04GGQ=;
 b=XZi2UcwlIPwSgg+Srq92UFvRteUe5QfU74nZIC1Aj/SDo9DUOcaNU3Fm2PTinI9OLO
 E8eyev1BsUFVaOecB9A6Pe3Ggv4OIMj9s+7wLAU/LCJ8h3vK2dLhn2PtZsvsKcNCrg9I
 xme3/f1j6AwR1saJARWVwBmYbkE/sD0hntSYHTpRxEvpFNtwPal8wD9RtRlo9vbgrU4y
 dq6OMpE+mvqGX+rxm+eLaKU2M9BQgVD5vPQhzm3NfqousRLWu/SOhplZ3zgzax0oixB3
 O02raU/cvu3S1xpAFn5H9U0ltR1i8C1y1VSc0zJGApKVeECukgxrWYmpBpK8PERF6FnZ
 PlbA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWiuizN9Y+MuEDbj4+F4NM3vrMrOK74qNw8VdD0L/m7ZsVx3rFTnbRnYOQLFZx5naUpT2C4bEkbSO0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwK4PbM6k5FU0wCd1nzzrGCmOPoesk8uCMXMYmCyqvRgJaGhwQ8
 is1rae8cjlcswaYtC/wTssO8tVKB8u7Wgh/o2EqDQzmUIkbPulMnnP42rHiGgRFKJVtmAWpi55O
 J5he9o5G7tyvWpZYI1Ea5w78D58F120wNPyGEMN04v6v1W2FXNidlh7ihu9qr7yI7D8bWxMU=
X-Gm-Gg: ASbGncuVEN5LKzJlqmKE8PCSuxgZr4ZGPtBPNBCsSyaETYO3dxE0Am8mRgohr6SOW5S
 FDgGmiOaZyaxULOU9wklQi+KM9K7MySH0AaY3pZ6rt1oimos6LobyZIsjwyRGeb5Oo65eh3ZFEU
 AV3xBFNSspV4PxQ/MhgmIl8rRsRblRUt1X97MePF3c4Pqq1OyiyWJDHKD0Vx/38fSRDO2PG34r2
 IaOpjBv2uFNvqH2kbRl1cyDfAlqYF9P5o81pFkGd0VMZ5xN3wvGICCP7ZKCqzbms+dyFbauKaq2
 VMeM1C2YJDqtjwZMFmz0bHPnaanYw0JGIzX/F5RwruQdA4wPGdK4Cy5pos5LIBmxPkaMkHPFLXs
 =
X-Received: by 2002:a05:6214:14aa:b0:6f8:c23c:5266 with SMTP id
 6a1803df08f44-6f8c23c834amr265731066d6.3.1747917540268; 
 Thu, 22 May 2025 05:39:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHt3dD1d3o6Uh9VFUBMuETCUX8JC+Gh5YdI+vMkCsFQ+A6CYWX5t0w0CnMrGeqa/WbJpReveg==
X-Received: by 2002:a05:6214:14aa:b0:6f8:c23c:5266 with SMTP id
 6a1803df08f44-6f8c23c834amr265730536d6.3.1747917539880; 
 Thu, 22 May 2025 05:38:59 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-328084b6c7csm32876471fa.2.2025.05.22.05.38.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 May 2025 05:38:59 -0700 (PDT)
Date: Thu, 22 May 2025 15:38:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Stephen Boyd <swboyd@chromium.org>,
 Chandan Uddaraju <chandanu@codeaurora.org>,
 Guenter Roeck <groeck@chromium.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vara Reddy <quic_varar@quicinc.com>,
 Rob Clark <robdclark@chromium.org>,
 Tanmay Shah <tanmay@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 04/45] drm/msm/dp: split msm_dp_panel_read_sink_caps()
 into two parts
Message-ID: <smj62cjqy7ihd3ywnvwkqzczlg7op4rqy3yrwlibjvouqerofr@bnlpwl3j4jge>
References: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
 <20241205-dp_mst-v1-4-f8618d42a99a@quicinc.com>
 <osctzl3bgutcjt3hjvgxaq64imn2i67hagqm5slfozf33tnj66@5hlfmqmt7if5>
 <2a54ffe8-8e40-49f6-8735-96da47e1bbc6@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2a54ffe8-8e40-49f6-8735-96da47e1bbc6@quicinc.com>
X-Proofpoint-GUID: Mna3RDCyOI_4z06qXcJjMsA9zlmJS9GT
X-Authority-Analysis: v=2.4 cv=J/Sq7BnS c=1 sm=1 tr=0 ts=682f1ae5 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=YGB3awJd4VowHVBKth8A:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: Mna3RDCyOI_4z06qXcJjMsA9zlmJS9GT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDEyOCBTYWx0ZWRfXxxWot0IQIQ8M
 /lJBoCUMqqX2M44PJkNGTyVaLqsPMkKxKZHuhofAaObgGGHkZFA6aJGLSSkA+lT6co2G4NxAcYg
 RUy0hG7vtJe+M163Z5qVXcpcHjVUpEOtm1tVJCIsZxIN1sDj1iO1IdR0213+HMYvtE+NyJHJxjk
 WVq3FUJfMoKUxgG9agIjxgovjmIK5YiTSkDulM11HxAkA7T4s4+66O4zV07HcCcw/7jTWuAorz9
 yTG5C6/JjQSmbpxtLMZhdxddFqjE+dJLByvY31c6+YnUT7eFW+e58CFxvuVwETvMgACHfAy4Fk5
 rEEKsSyrPtrvKOF68k06bzdHOZlX3RNnCC5q6EQP+d9ZQMzwcGKgsT9enG84uCIC3L36hnc00Pa
 bc+bpZGR3x56FTVxmeyR1w1kX05cVExzKw9n+0N58Vu2smNMrQQXXouu5HhwFhqRWPFwQTo2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 mlxlogscore=999 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
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

On Thu, May 22, 2025 at 05:51:52PM +0800, Yongxing Mou wrote:
> 
> 
> On 2024/12/6 16:51, Dmitry Baryshkov wrote:
> > On Thu, Dec 05, 2024 at 08:31:35PM -0800, Abhinav Kumar wrote:
> > > In preparation of DP MST where link caps are read for the
> > > immediate downstream device and the edid is read through
> > > sideband messaging, split the msm_dp_panel_read_sink_caps() into
> > > two parts which read the link parameters and the edid parts
> > > respectively.
> > 
> > As you are touching this part, could you please refactor the code
> > instead by dropping the msm_dp_panel->drm_edid? There should be no need
> > to store EDID in the panel structure.
> > 
> Hi, Dmitry, Abhinav will be leaving the company and will no longer be
> responsible for updating and address the comments. I will take over handling
> MST patch series. Regarding this comments, I don't got that where the
> drm_edid should be stored. In MST cases, where multiple panels exist, i
> think that there should be a separate drm_edid saved for each panel.

Why do we need to store EDID at all?

-- 
With best wishes
Dmitry
