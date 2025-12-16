Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5283DCC1429
	for <lists+freedreno@lfdr.de>; Tue, 16 Dec 2025 08:14:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3EC610E101;
	Tue, 16 Dec 2025 07:14:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ohs9IdXq";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Do+NqdJM";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73E5B10E0DE
 for <freedreno@lists.freedesktop.org>; Tue, 16 Dec 2025 07:14:51 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BG44leK1450388
 for <freedreno@lists.freedesktop.org>; Tue, 16 Dec 2025 07:14:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Am0uuG/SMaWGn5BG7PqsVygZOCHB1Fc3JGgHjjK0254=; b=ohs9IdXqsQ7uFp7R
 5cgS6Qs3b2tYXCPCmtLqZ62d2MTEeeX/hjz0Af420poHabXs9qRnAcMJqHJzSpwm
 F7/B57jfmAevd6ChvNCjGMSbJwS7vse6eSO4q2PPuT/KWF+fQaIko6Fxau5rY3EW
 dz9tlnJm/eTzZMzQhjRJU2pG4x8z4N6akHPqJaaFDDy4gHH/j9d3xQArUTTq9EP9
 G+kBwZKhpMTIuegC+WN9Uv4OHgrcx4n/pWfMprzW2yZdkC+gHUSQVYNGNI/HpKsx
 myZsRD4bJ5uWbfOx+6QIihlDhmwgmwVevJNoprVG2NG5hiunxbX4VVwKMsK56yhh
 oW2KZw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b2hgaunkr-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 16 Dec 2025 07:14:50 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-88a344b86f7so63217246d6.0
 for <freedreno@lists.freedesktop.org>; Mon, 15 Dec 2025 23:14:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1765869290; x=1766474090;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Am0uuG/SMaWGn5BG7PqsVygZOCHB1Fc3JGgHjjK0254=;
 b=Do+NqdJM9MdVFpaGK3u8vFNqYru4CgoDnp92/H0YU55O24OpieLz0JX5EtSDK1CUVG
 Kt+3R9wdAXwmYs/Hlj+I/H2bLDLdcBOytvM8Ch62bpzUrl7tdrIjrSkrbRH6/H2quoMQ
 8ZsUUlTXpXgn4jLNL83e2sAvbldOoXnJleWXsj9WYfOGLSQp6lJMFPD+daaRLBF3FC/M
 pBBbi2QdLa5IXq5hzk2PhODIBFRX4OTQZ+FuRVgQGLeLqF6j5phfnsNbJxi5rwP6OHoA
 DolqUAt8x7YbMeMbhEN0/UjTy0oDwWCX6rTk+IHrEnDrGm5ApQ1fVilw64nkLVuFIVdW
 P9yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765869290; x=1766474090;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Am0uuG/SMaWGn5BG7PqsVygZOCHB1Fc3JGgHjjK0254=;
 b=a9i2wOd4HGaVZkyWB84vs14Ig+lskyJxB7MW3KkM6SkQJF0q4z34wPJUeOTKDIXkdm
 tdx25QwyKuQuOZsOwkYBpbFysfTV3OyZwTl+1qAyJoYmIaOk8oZLK2YG3qIfq13kE/mw
 26ZxgARCc9TQ6Aqe2fHWvHAAzhDqdUSJyhYkpoMb852q44/to2wjxar7Pg6Eq9Xo+cq5
 TA3nQ9tNIwMwM2ZobFtJJ5HlmwEAfMocj2XL0kbdTC4hqSxdOJGJ/JFn81Ujdrz9CGBm
 l02bJ5nZLqlL52fKui4o/suznRuF6NN+ehk8HtX1Oxa5YtNX0P7bRzu0VPBImzLnSe26
 Z0Mg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUV8RXcnCmIiT8QYZJFl/43x3f+WrEVbr9ZXw31NQEYPDFrkBUb9wxm0QLfLIhQ2CB7yqQrFOVTbSk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzD74sECmX0/4wJ6cRjm9F0ZwE7kRbHjewyrBsZypau6ext/Uog
 MVRjKvvp6yyqRDywU7kswr3nfrpDCfWwMrR/YCybmHeMw6xd2BqblY5E3YZ8am7K3ng1rEA20Vq
 ndu4Sktjc67L6fxZu1YOx+ATFb5bpIp4M4AKptG3TIJ6+fIbjjJW1HhEnW1OQwmG7YfAaqo4=
X-Gm-Gg: AY/fxX6Tk3zDcbl10HahVFgISsPTmdHCa14Ml2jYcv3vUic7pAuGcLuell1r/5y5LTX
 VCCOxUX79U6ARDw7xUFZ+dO4A5bNW0A70vP8+csPyQ8DClyvxUJwmjJFzmXX1KTvz2zwmXB09u3
 hgkBI4wVd/Ava++PuQwSSNvFNjunPqkVMz3pPXaZsIfON0OPH6mpDVzpEWXAaeA/VStepQWx5G8
 NmTYsZqX1BP4zAEAm5fiS/VP8Cx4NNmsl6lABBcmp3Sv5H6YeyWKXwDPoajaAp8BKakJGec6TQa
 Mrui9Q69ywFWJXsXib5gRuRFLMPZ+NnyvcI3mX9UApOC/BPOqTMkwTGN8ZeAwSG5EamWWBQpZCt
 ULYgLeIOWZLEJ9RTaHwBI/5+riqZX22R08p69n254Fci/JYD4gyVu9YgWws4aMX2bJlkX2kg=
X-Received: by 2002:a05:6214:2e45:b0:882:7571:c012 with SMTP id
 6a1803df08f44-888801cba45mr175118246d6.55.1765869289746; 
 Mon, 15 Dec 2025 23:14:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE2lJX1RHdL61KthpwkRgPaivxdvAcRF1rHNtkwmJXCWmk9l44q+8qM2lkJENhb3atu86mA7Q==
X-Received: by 2002:a05:6214:2e45:b0:882:7571:c012 with SMTP id
 6a1803df08f44-888801cba45mr175117936d6.55.1765869289243; 
 Mon, 15 Dec 2025 23:14:49 -0800 (PST)
Received: from yuanjiey.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-889a860ce52sm67808286d6.50.2025.12.15.23.14.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Dec 2025 23:14:48 -0800 (PST)
Date: Tue, 16 Dec 2025 15:14:37 +0800
From: yuanjiey <yuanjie.yang@oss.qualcomm.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: yongxing.mou@oss.qualcomm.com, robin.clark@oss.qualcomm.com,
 tzimmermann@suse.de, dri-devel@lists.freedesktop.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org,
 konrad.dybcio@oss.qualcomm.com, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, krzk+dt@kernel.org,
 neil.armstrong@linaro.org, jesszhan0024@gmail.com, airlied@gmail.com,
 maarten.lankhorst@linux.intel.com, linux-arm-msm@vger.kernel.org,
 lumag@kernel.org, simona@ffwll.ch, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, sean@poorly.run,
 marijn.suijten@somainline.org, abhinav.kumar@linux.dev, mripard@kernel.org
Subject: Re: [PATCH v3 04/11] dt-bindings: display/msm: qcom,kaanapali-mdss:
 Add Kaanapali
Message-ID: <aUEG3TL34CM2V5Z+@yuanjiey.ap.qualcomm.com>
References: <20251215083854.577-1-yuanjie.yang@oss.qualcomm.com>
 <20251215083854.577-5-yuanjie.yang@oss.qualcomm.com>
 <176579137354.1486530.823295322686100207.robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <176579137354.1486530.823295322686100207.robh@kernel.org>
X-Proofpoint-GUID: 38WT6EGL6krCBF5ilV3DvC8TPVJCj1DR
X-Proofpoint-ORIG-GUID: 38WT6EGL6krCBF5ilV3DvC8TPVJCj1DR
X-Authority-Analysis: v=2.4 cv=GpxPO01C c=1 sm=1 tr=0 ts=694106ea cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=0awkmHLjsCMGZ7zvgVIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDA1OCBTYWx0ZWRfX4mr+ygoP5A5t
 eac4g4E+kzREv6BD7uR7tqpoCzE5oUyH/TKBvQeG05lvQ1IquxHilm0D7Kj/ScrJ7cPRPbHssOa
 OwBJMIitlFQ74olB0hcBPeWOKFUgnnlYH0C5qiWXaFLk1vkq3+ugdWo3HM551j8VYBskvyaoQxr
 ZJ3ZKq3bEzjZij57NWuv7IwEMyhCk+X1B+3kRUI5vCxU6abY3yegunKJYV28fZxHay+rYSCoxXz
 bnS+vupbS/TzzJeuRJNGPc5Gg/sINAa1yxcbeFke7gbi9FjuQvblR6tnAuYGcwzYuZpr2b2TK4f
 HRHwiC8xohA5sDwZjmTqrCpjKYvckBZrBiNIpKx0D6lDPmaVa7klNEKho3XY+dQobUkqXnZtdlU
 t+qOp34mn5hTDb2YoXZYDdRmHY3jRg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_01,2025-12-15_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512160058
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

On Mon, Dec 15, 2025 at 03:36:13AM -0600, Rob Herring (Arm) wrote:
> 
> On Mon, 15 Dec 2025 16:38:47 +0800, yuanjie yang wrote:
> > From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > 
> > Kaanapali introduces DPU 13.0.0 and DSI 2.10. Compared to SM8750,
> > Kaanapali has significant register changes, making it incompatible
> > with SM8750. So add MDSS/MDP display subsystem for Qualcomm Kaanapali.
> > 
> > Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > ---
> >  .../display/msm/qcom,kaanapali-mdss.yaml      | 297 ++++++++++++++++++
> >  1 file changed, 297 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml
> > 
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.example.dtb: phy@9ac1000 (qcom,kaanapali-dsi-phy-3nm): reg: [[0, 162271232], [0, 460], [0, 162271744], [0, 128], [0, 162272512], [0, 1024]] is too long
> 	from schema $id: http://devicetree.org/schemas/display/msm/dsi-phy-7nm.yaml
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.kernel.org/project/devicetree/patch/20251215083854.577-5-yuanjie.yang@oss.qualcomm.com
> 
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade

pip3 install dtschema --upgrade

After update package, 
and use：  make dt_binding_check   I see the same issue.

but use single check:
make dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml
I don't see any error/warning.

will fix it in next patch.

Thanks,
Yuanjie

> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.
> 
