Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 307C1C5D8EF
	for <lists+freedreno@lfdr.de>; Fri, 14 Nov 2025 15:26:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED61810EA84;
	Fri, 14 Nov 2025 14:26:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="onGjc7qK";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OQhKEQca";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BDDF10E248
 for <freedreno@lists.freedesktop.org>; Fri, 14 Nov 2025 14:26:36 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AEDuBgf4123866
 for <freedreno@lists.freedesktop.org>; Fri, 14 Nov 2025 14:26:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 l9no/0GxZu07rSqXKlYIfPnkQay7eVZlKqtoBFEi2pc=; b=onGjc7qK7k480p0+
 9xm/ydktUD61A5FPyRVnxcyvkkUEmSezTIcdhaqTu1ES2CI77dsomBXbBPqNRR4z
 x/9Eoy2WPml6sskYOZhjw3q3k4xY+c3/+LLNY3YmkHj/6nZg6Ws8B/Yil6MMk7Jj
 Y0Ad1c0M8K2ixfIJMcv8TyQWpvzMKkoPOZWEw8lGz+oNXoHXZi20lDnJWq2HLlzp
 sPniywPeDgRsLlQB4GMn0u2G5wnh8dueM5BhOgRJd8WIInrexXLUG99zASdOiB3+
 Kjvqlfp7XaWmlmZpMe5rg/XiYavJxbJKjJW2OJ1/eVsy3HVsrY9F8tTOKwafco8F
 gOpqJA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ae5r7r2vx-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 14 Nov 2025 14:26:35 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4e89f4a502cso55284821cf.2
 for <freedreno@lists.freedesktop.org>; Fri, 14 Nov 2025 06:26:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763130394; x=1763735194;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l9no/0GxZu07rSqXKlYIfPnkQay7eVZlKqtoBFEi2pc=;
 b=OQhKEQcaUn92WeSxLfK67GbX1az4kUwA4aZnTn/JYa6OnolPVok0QRA9GCaPIqAqhl
 oGw2toimOz3pc0Ne3FT2qnak4QQzKWqtIeODAzT12oUbhOcqe/I8WnNSTPy35tOdZjS8
 XjnzVjpmz+P9+BiYlO/c4m+AjxrBaQNOwIsU4qEsukqCZDAQmQ65BsIISlnbinfphuWY
 K7XwB9Z+xmm6cEFpePb6T5ivkASjRNUo6N4v67h11oq4Vm/MdBpTQMDSdHbWAYJIJJ18
 QvZW5FDeB4owWE85CuSaZBFs2c4ke/koCM7uCna+a3X3muO23zvBmOrY5iGEY7bRRT0r
 2zAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763130394; x=1763735194;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=l9no/0GxZu07rSqXKlYIfPnkQay7eVZlKqtoBFEi2pc=;
 b=VfLV9LvtIbDcLdZVTl3w0MuN3g/hUH2TEIk0uwPHEWa1PKhhBsY92qMXZpBQ+0YtJ7
 xN31/KpLGAoKaLy7Ns3QgKFl15gjkDjSf0bGiVz1QV6yosy/F18TkmfXbh6+ZUI0UvFY
 M+pXYgg2payQpG8cas8WZubCeEe6hROlX3j/16z916yqHyQwYMW+LinOWk/K9HmUPra8
 Mf0ez7JbXOaqfYYRh1io9vb9wb2SO5spALEF82EisknSIrOGDYBgCAwL+tA0KbP33ZWN
 oLbqY0SNz+VVj+6KRUcmVTMoAwSoRFvTADaryvIuj/LoBpJ/WhBmKCHT9jAICP9u2yAe
 bhbw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXdKY6Jx/L2XdvN4Jjd7iYfj16DgTyjgU5h9IeHaI3RJfs0A7fD0VFgdo+STHrl8c7RZldwnXKb+5k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwV9vymnaBIOdHZ8Kt1rr33h6Vmx8pesVxNRFSlBLEeX8+tOkGa
 EqGTMGNUAo/6mP0COvMdF5IH2OJsPhg1UqI8S95tfotNV31BmQ36+Viw24Noxg2hZNBVwOOtuSu
 mNLtMTZccoDQDJtPYJ+ttXacNvDcYTihKsoohbnmQzHwX/VUZ77XJRfXZG9IjC3NzO9HrNgE=
X-Gm-Gg: ASbGncscFGzm6uo0VD1Snux84SLH8O816CHGO6qAw2PsYS27Go4rwADjXw/qzVPpTLA
 +ZZtxJz7MjX1njYgyX8SBxZpit2bLMKi02D5QUsyaewnrjb1JIGXv2xQjoowfTwGik6UhLfRthW
 EzNOGe6EePhHAZkHUiNwsfhuWV+bgAzZ+boSWJiWfkieLoJEJGV4DctPQq7ki/8GKfmin1zUVmK
 eBJonJFDTUzuaOuk/7APJNIL2R5vKDeyVaLsoQY19zwYCmIlY6huzQGXzZUgv4o/4hy4xhO9nKh
 UMLOWcY4qN0wJgnYhl4N0PbAalFNrkj/2+lgdAjzZlTerpAVJ/K/4MWOeC8b5dX7iBdD7jm/lRS
 DB1Q0KRqF6iywgi7uLZ0QtfSDG3Yq9bJ4Pv0pHoKNvm0kMq4HjXcL6XomWAt+ZXh8VLw10Ixqac
 kMSguTqPCjtJ3G
X-Received: by 2002:ac8:5809:0:b0:4ed:1948:a8a2 with SMTP id
 d75a77b69052e-4edf212af38mr48477221cf.40.1763130394368; 
 Fri, 14 Nov 2025 06:26:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGHscNoHLm1MuydPFCmacZaAgfo0Tvh6OgbQ4/hlbC4OeYTE54MJSZKbngEqsl8733UCg4WVw==
X-Received: by 2002:ac8:5809:0:b0:4ed:1948:a8a2 with SMTP id
 d75a77b69052e-4edf212af38mr48476551cf.40.1763130393831; 
 Fri, 14 Nov 2025 06:26:33 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-37b9cee0cabsm10318821fa.40.2025.11.14.06.26.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Nov 2025 06:26:33 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abel.vesa@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3 0/7] drm/msm: Add display support for Glymur platform
Date: Fri, 14 Nov 2025 16:26:27 +0200
Message-ID: <176312947284.1737000.2080843930887893997.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251027-glymur-display-v3-0-aa13055818ac@linaro.org>
References: <20251027-glymur-display-v3-0-aa13055818ac@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDExNiBTYWx0ZWRfXwGOZFQtqA+yi
 MmU5YCxdG4IMRQ6NND+s/nnwbVndtrIlN7Yy8nSNBQRpPjy5JcXH1ipei0FF+L7bzBeaHI5WwUh
 oj1rUH9N8PcUfMMPyroJAQnyyhhrqZjGfWMX+xUNd8a5GLCvWYXYOzLYm3StbGRinQkfpLaUMv6
 Ao464x9bebfkkKAyHfqRRXSRjAWqmT9pgIr8RES0o+KKMfG4WkioX2lR6ewxfkwDP0FDCQAlKeM
 PxH9Ece5ezf8r6Pp9RFPeOEIkH7SZj1Cyl8Kal/Y46codNiK7zcA3rZoJ3waiyQuDWd/tRA5c+M
 BttPa2aCJuN0lbXmz6R2XdVrXy7/K5gjcZVCibdfmDdw+ahr5zHTA/QCIPS86U7fH68JtDr3i72
 +9uxtY/oAqD7QYccADL03B3RVjspOQ==
X-Proofpoint-ORIG-GUID: rGz3jfVVj_TxO4jSjTXC4q05ocVVMjXM
X-Authority-Analysis: v=2.4 cv=BJO+bVQG c=1 sm=1 tr=0 ts=69173c1b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=c_IYe_yHoYF0OweyKxMA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: rGz3jfVVj_TxO4jSjTXC4q05ocVVMjXM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 adultscore=0 spamscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511140116
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

On Mon, 27 Oct 2025 16:59:17 +0200, Abel Vesa wrote:
> The Glymur MDSS is based on the one found in SM8750, with 2 minor number
> version bump.
> 
> 

Applied to msm-next, thanks!

[1/7] dt-bindings: display: msm: Document the Glymur Mobile Display SubSystem
      https://gitlab.freedesktop.org/lumag/msm/-/commit/29deccdb0927
[2/7] dt-bindings: display: msm: Document the Glymur Display Processing Unit
      https://gitlab.freedesktop.org/lumag/msm/-/commit/306305f38cd5
[3/7] dt-bindings: display: msm: Document the Glymur DiplayPort controller
      https://gitlab.freedesktop.org/lumag/msm/-/commit/144a3862f626
[4/7] drm/msm/mdss: Add Glymur device configuration
      https://gitlab.freedesktop.org/lumag/msm/-/commit/401388017c14
[5/7] drm/msm/dpu: Add support for Glymur
      https://gitlab.freedesktop.org/lumag/msm/-/commit/d15c65a4645c
[6/7] drm/msm/dp: Add support for Glymur
      https://gitlab.freedesktop.org/lumag/msm/-/commit/eaedeef2b9aa
[7/7] soc: qcom: ubwc: Add configuration Glymur platform
      (no commit info)

Best regards,
-- 
With best wishes
Dmitry


