Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C76B1BFCB
	for <lists+freedreno@lfdr.de>; Wed,  6 Aug 2025 07:09:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3FDB10E2E9;
	Wed,  6 Aug 2025 05:09:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="og2ZVOMe";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D46510E2E9
 for <freedreno@lists.freedesktop.org>; Wed,  6 Aug 2025 05:09:13 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5761ekTf012556
 for <freedreno@lists.freedesktop.org>; Wed, 6 Aug 2025 05:09:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=68sovdrrPXA8QmhrUduSJfVa
 9A4OBtR8N7I8vuIQI5E=; b=og2ZVOMe+cesabO+Jelxst82ERdX0OQCdHzquAe4
 xAMYVlYsx9fTdGKY5c5lACgqhvs9X4fJ5HiYHkBZxM71YIDhHymJ0D6DeoovpG1Q
 JoB7HB2KuIws5dKopH1fNX833/QEMwj+SIIAD2Gtubn48raOfmoz0gfMj3MQB6Ir
 sO4SfyTKq38M7VeKCxvka7E1sWyt7xrzT7J3/GJMxMfgLbz92CI+zNxbXa1C8WTM
 SCQ4iRlcrxbZBADmrxHtYxWxdFuCF6/z//nUqlv39TItIvfuxTnsD565TfAK13UG
 CRJI88EAiq+t0dej+CHktqLiGIFHY/B8nrKKGhGIuFdmJw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpvysgq9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 06 Aug 2025 05:09:12 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4b06908ccacso66103361cf.1
 for <freedreno@lists.freedesktop.org>; Tue, 05 Aug 2025 22:09:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754456951; x=1755061751;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=68sovdrrPXA8QmhrUduSJfVa9A4OBtR8N7I8vuIQI5E=;
 b=xNQYvrpsJaDEdTlmUdPI0jS4bdxzc1SJz2c2sztcMpTN2+xPbpmxyB2YDlXQa58aLm
 fe8PrYCVpf+vWnTGumzGBEB3a/CbEF120m1rHdUiEBLqIsu7cXYGadBsnhoreWnPiP5O
 fuobNe+mKmmfpBcbtCEA9yEsgcL6MfVm8FO8A/rOZc+173Q8dTSbY2F2ssYqvnA6AZOr
 2xixaB2bK0E3A8/nEdV6KaBoKMZqZJC/3bZYFUjoDCzHYrOwyjtwpaWXcusBCKsVkSNq
 j4fMmJ3JuNup15RvLP+N46OI8Nx0K9Z8bOEU5p64eO4L+TEQj3c8tqrIqT98V2XHXD7b
 gVGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxQdfRwnRdAVsmUKTtM9y4JxBL+ryDvojI7OfaU8GB5JkRf2D5n/+18KzvbiqBXxrIjCTGsDQNbBA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyxuOg4c0/Lj6E5xmNxW1m7lBpiTzI/tVkGYYVq/Apwo7lm407p
 EiCTWwAmF5QOAh7F+8SXa+ocZzlCe2bPIhl0WIPz/ssuqvzmTCwZj05Q0q3UpM+VjOaMo3/nJws
 4Doe8OYDht8b+MlBK8RQUsBOX5E912qQ14ZJG7N/H5el34XHirnkvlPGcJ+bxmMx6fy9rO/k=
X-Gm-Gg: ASbGncvH22Awl6h+yfjAGtFRSTNOG8cHYiUqIAJ/vFzS2TyxiZaH3lsCY7llqWI3G2E
 1OF9twfB12X0a6dfEikHidMhhvwCk96jvthz48WxtzUoGa+i7MactJu/ujyJscDdiuCalk/qz8i
 fBYj5BjA7NcaSreD3LKu2egRynr5ZWyeH6otpusyuLSUBooUl7tNRUGWCeSiK66dFYGLDpuJiv9
 4e7Ja238F4mItqoezKCmAr7FrPRDl6vS70GYkbdTJ/YKCrKsWx0knz1LA/hvs9dvr6H+26+Givl
 pJfMptYsWVl9UUQXsJ9sVviYI+JYl9THwMesqBrYhiMCLOHPgVBNpUi8WLBWoTJc73n/KEHBf8s
 y3oBuuczCtGQybMCbtKh0qxlzSae1ZRphSfjw8cLNqghm5XY8x2hp
X-Received: by 2002:a05:622a:1814:b0:4b0:8f9a:857e with SMTP id
 d75a77b69052e-4b0915e7139mr26390711cf.56.1754456951380; 
 Tue, 05 Aug 2025 22:09:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFotMGRHjeIm1vbeYr6C42G1MErJI4kAH19Ib7B+nZARpwmp9NCyvWcD9AMhVLBzKBMuD1ytw==
X-Received: by 2002:a05:622a:1814:b0:4b0:8f9a:857e with SMTP id
 d75a77b69052e-4b0915e7139mr26390171cf.56.1754456950777; 
 Tue, 05 Aug 2025 22:09:10 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b88c98aabsm2215050e87.103.2025.08.05.22.09.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Aug 2025 22:09:09 -0700 (PDT)
Date: Wed, 6 Aug 2025 08:09:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
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
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/6] dt-bindings: display/msm: dp-controller: document
 QCS8300 compatible
Message-ID: <b3tgv7zhiix5rzrw4xv5rtaoaikstdew5lo4htvepl4phl44dx@q3xztyk6fagy>
References: <20250806-mdssdt_qcs8300-v6-0-dbc17a8b86af@quicinc.com>
 <20250806-mdssdt_qcs8300-v6-2-dbc17a8b86af@quicinc.com>
 <b24ln55wgmjzksugbowgilxqbnp6d6mgq4cdqljrj4jftuefa5@gjcszc3t4bqg>
 <179982fe-ff3f-4d57-9ac9-15f0512facb3@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179982fe-ff3f-4d57-9ac9-15f0512facb3@quicinc.com>
X-Proofpoint-GUID: TFysLlkFBN7NNqVXIrJmOlND2RDk1zJL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX9fCIGSte20rI
 7kvPBp8MtQ0MM4S/Sia/MSH5B2GiNE1vjZk/DSU0STeK9sqAKY7zVb7fVBwscYASAVeq59yOxhc
 kOsSjw/W6MthijTNMPLzKxsqlIY3XjimNI9kT9GUlQ9eixBUfRu1Py12Fp9BanCUDIxyHLtntiY
 1l7t02zbeHsjsxJrvAJaKmRpzwFXgHK/ptJteSonL7SYc45JcOecBynLNsl3Dlmt0Gdo4Fl2JRi
 zzqMAljt10wawQMELbRuEr6Q3umODixS5L0VfFChe9OAKtcRtkgzwpoDs0D+T8Lov76Bkehweh+
 /ZQrfLPPt/4HpFFrwYDaRlYK2RTYEIbKHR+AzoQW+ZGwAnxMYn2abylwkJxGhEvi0aDZZPnTwXL
 8ntAY/N6
X-Proofpoint-ORIG-GUID: TFysLlkFBN7NNqVXIrJmOlND2RDk1zJL
X-Authority-Analysis: v=2.4 cv=NsLRc9dJ c=1 sm=1 tr=0 ts=6892e378 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=sYGqIWXcBYFHAWytNyQA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_05,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009
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

On Wed, Aug 06, 2025 at 12:07:55PM +0800, Yongxing Mou wrote:
> 
> 
> On 2025/8/6 11:46, Dmitry Baryshkov wrote:
> > On Wed, Aug 06, 2025 at 11:16:46AM +0800, Yongxing Mou wrote:
> > > Add compatible string for the DisplayPort controller found on the
> > > Qualcomm QCS8300 SoC.
> > 
> > 
> > Typical comment: you've missed the explanation, why it can not use
> > fallback.
> > 
> Hi, Dmitry, we move this explanation to DP controller patch (patch 6). There
> we provide a detailed explanation of the DP controller,why we need this
> compatible, and why not use fallback. Thanks.

They are different patches, reviewed by different people. C&P might be
helpful enough.

> > > 
> > > Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> > > ---
> > >   Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 2 ++
> > >   1 file changed, 2 insertions(+)

-- 
With best wishes
Dmitry
